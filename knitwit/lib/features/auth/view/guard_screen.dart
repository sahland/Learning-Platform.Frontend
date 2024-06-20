import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:knitwit/features/auth/widgets/widgets.dart';

@RoutePage()
class GuardScreen extends StatelessWidget {
  const GuardScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return const Scaffold(
      body: Column(
      children: [
        SizedBox(height: 150),
        Center(
            child: Text(
              'Авторизируйтесь',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFBE1257),
                fontSize: 24,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Center(
            child: Text(
              'чтобы пользоваться всеми функциями',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFA3ABC3),
                fontSize: 22,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 60),
          AuthButton(),
      ],
    ), 
    );
     
  }
}