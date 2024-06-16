import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knitwit/features/auth/bloc/auth_bloc.dart';
import 'package:knitwit/router/router.dart';

class AuthBox extends StatefulWidget {
  const AuthBox({super.key});

  @override
  State<AuthBox> createState() => _AuthBoxState();
}

class _AuthBoxState extends State<AuthBox> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late AuthBloc _authBloc;

  @override
  void initState() {
    super.initState();
    _authBloc = context.read<AuthBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthorizedState) {
          context.router.push(const ProfileRoute());
        } else if (state is AuthFailedAuthorizedState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Authorization error: ${state.error}')),
          );
        }
      },
      child: Column(
        children: [
          SizedBox(height: 40),
          const Image(
            image: AssetImage('./assets/images/knitwit_big_icon.png')
          ),
          const SizedBox(height: 40),
          const Center(
            child: Text(
              'Вход',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFA3ABC3),
                fontSize: 24,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 80),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                hintText: 'Логин',
                hintStyle: TextStyle(color: Color(0xFF787878)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              ),
              style: TextStyle(color: Color(0xFF787878)),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: 'Пароль',
                hintStyle: TextStyle(color: Color(0xFF787878)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              ),
              obscureText: true,
              style: TextStyle(color: Color(0xFF787878)),
            ),
          ),
          SizedBox(height: 140),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFBE1257),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: const Size(320, 48),
              ),
              onPressed: () async {
                final completer = Completer();
                _authBloc.add(AuthAuthorizeEvent(
                  username: _usernameController.text,
                  password: _passwordController.text,
                  completer: completer,
                ));
                try {
                  await completer.future;
                  if (isAuthorized) {
                    context.router.push(const ProfileRoute());
                  }
                } catch (error) {
                  // Ошибка уже обработана в BlocListener
                }
              },
              child: const Text(
                'Вход',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent
              ),
              onPressed: () {
                context.router.push(const RegisterRoute());
              },
              child: const Text(
                'Регистрация',
                style: TextStyle(
                  color: Color(0xFFBE1257),
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
