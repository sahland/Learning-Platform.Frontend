import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:knitwit/router/router.dart';

class RegisterBox extends StatefulWidget {
  const RegisterBox({super.key});

  @override
  State<RegisterBox> createState() => _RegisterBoxState();
}

class _RegisterBoxState extends State<RegisterBox> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40),
        const Image(
          image: AssetImage('./assets/images/knitwit_big_icon.png')
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
        const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: TextField(
            decoration: InputDecoration(
              hintText: 'Логин',
              hintStyle: TextStyle(color: Color(0xFF787878)),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            ),
            style: TextStyle(color: Color(0xFF787878)),
          ),
        ),
        const SizedBox(height: 20),
        const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: TextField(
            decoration: InputDecoration(
              hintText: 'Пароль',
              hintStyle: TextStyle(color: Color(0xFF787878)),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            ),
            style: TextStyle(color: Color(0xFF787878)),
          ),
        ),
        const SizedBox(height: 20),
        const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: TextField(
            decoration: InputDecoration(
              hintText: 'Подтверждение пароля',
              hintStyle: TextStyle(color: Color(0xFF787878)),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            ),
            style: TextStyle(color: Color(0xFF787878)),
          ),
        ),
        const SizedBox(height: 20),
        const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: TextField(
            decoration: InputDecoration(
              hintText: 'Email',
              hintStyle: TextStyle(color: Color(0xFF787878)),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            ),
            style: TextStyle(color: Color(0xFF787878)),
          ),
        ),

        SizedBox(height: 47),
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor:  Color(0xFFBE1257),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: const Size(320, 48),
              ),
            onPressed:() {
              //context.router.push(const AuthRoute());
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
              shadowColor: Colors.transparent
              ),
            onPressed:() {
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
    );
  }
}