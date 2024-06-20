import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knitwit/features/auth/bloc/auth_bloc.dart';
import 'package:knitwit/router/router.dart';

class RegisterBox extends StatefulWidget {
  const RegisterBox({super.key});

  @override
  State<RegisterBox> createState() => _RegisterBoxState();
}

class _RegisterBoxState extends State<RegisterBox> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  late AuthBloc _authBloc;

  @override
  void initState() {
    super.initState();
    _authBloc = context.read<AuthBloc>();
  }

  bool _validateFields() {
    if (_loginController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty ||
        _emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Пожалуйста, заполните все поля')),
      );
      return false;
    }
    return true;
  }

  bool _validatePassword() {
    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Пароли не совпадают')),
      );
      return false;
    }
    return true;
  }

  bool _validateEmail() {
    final email = _emailController.text;
    if (!email.contains('@')) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Некорректный адрес электронной почты')),
      );
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthRequestState) {
          context.router.push(const NoauthProfileRoute());
        }
      },
      child: Column(
        children: [
          SizedBox(height: 40),
          const Image(
            image: AssetImage('./assets/images/knitwit_big_icon.png'),
          ),
          const SizedBox(height: 40),
          const Center(
            child: Text(
              'Регистрация',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFA3ABC3),
                fontSize: 24,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: TextField(
              controller: _loginController,
              decoration: const InputDecoration(
                hintText: 'Логин',
                hintStyle: TextStyle(color: Color(0xFF787878)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              ),
              style: const TextStyle(color: Color(0xFF787878)),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Пароль',
                hintStyle: TextStyle(color: Color(0xFF787878)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              ),
              style: const TextStyle(color: Color(0xFF787878)),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Подтверждение пароля',
                hintStyle: TextStyle(color: Color(0xFF787878)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              ),
              style: const TextStyle(color: Color(0xFF787878)),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                hintText: 'Email',
                hintStyle: TextStyle(color: Color(0xFF787878)),
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
              ),
              style: const TextStyle(color: Color(0xFF787878)),
            ),
          ),
          const SizedBox(height: 47),
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
                if (_validateFields() &&
                    _validatePassword() &&
                    _validateEmail()) {
                  _authBloc.add(AuthRegisterEvent(// Replace with actual user ID handling logic
                      username: _loginController.text,
                      password: _passwordController.text,
                      confirmPassword: _confirmPasswordController.text,
                      email: _emailController.text,
                    ),
                  );
                  } try {
                    final completer = Completer();
                    await completer.future;
                    context.router.push(const NoauthProfileRoute());
                  } catch (error) {
                    // Handle error
                  }
                },
              child: const Text(
                'Регистрация',
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
                shadowColor: Colors.transparent,
              ),
              onPressed: () {
                context.router.push(const AuthRoute());
              },
              child: const Text(
                'Вход',
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
