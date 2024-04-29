import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:knitwit/router/router.dart';

class UserProfile extends StatefulWidget {

  const UserProfile({super.key,});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile>{
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: CircleAvatar(
              radius: 63,
              backgroundImage: AssetImage('./assets/images/user_avatar.jpg'),
            ),
          ),
          const SizedBox(height: 20),
          const Row(
            children: [
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                          'Username',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'User ID: 1234567890',
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
          const SizedBox(height: 10),
          Center(
            child:
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFBE1257),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                )
              ),
              onPressed:() {
                context.router.push(const ProfileRedactRoute());
              },
              child: const Text(
                  'Редактировать профиль',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          DecoratedBox(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.white,
                    width: 0.5,
                  )
                )
              ),
            child: Container(
              height: 6.0,
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              elevation: 0,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            onPressed: () {
              context.router.push(const FavoriteCoursesRoute());
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.zero,
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Отслеживаемые курсы',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              elevation: 0,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            onPressed: () {
              context.router.push(const CompletedCourseRoute());
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.zero,
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Пройденные курсы',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              elevation: 0,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            onPressed: () {
              context.router.push(const EditorRoute());
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.zero,
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Создать курс',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              elevation: 0,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            onPressed: () {
              context.router.push(const MyCoursesRoute());
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.zero,
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Созданные мной курсы',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              elevation: 0,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            onPressed: () {
              context.router.push(const SettingsRoute());
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.zero,
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Настройки',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              elevation: 0,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            onPressed: () {},
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.zero,
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Выйти из аккаунта',
                  style: TextStyle(
                    color: Color(0xFFBE1257),
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

