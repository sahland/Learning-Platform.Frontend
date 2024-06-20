import 'package:flutter/material.dart';
import 'package:knitwit/features/auth/widgets/widgets.dart';

class ProfileUser extends StatefulWidget {
  const ProfileUser({super.key});

  @override
  State<ProfileUser> createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: Column(
        children: [
          Center(
            child: CircleAvatar(
              backgroundImage: NetworkImage('http://knitwit.ru:9000/knitwit/user_avatars/standart_avatar.png'),
              radius: 63,
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                          'Гость',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'User ID: N/A',
                        style: TextStyle(
                            color: Color(0xFFA4ACC3),
                            fontSize: 12,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  )
              )
            ],
          ),
          SizedBox(height: 10),

        ],
      ),
    );
  }
}