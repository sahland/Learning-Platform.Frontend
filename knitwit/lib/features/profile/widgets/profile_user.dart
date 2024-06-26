import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:knitwit/features/auth/bloc/auth_bloc.dart';
import 'package:knitwit/router/router.dart';
import '../../../common/common.dart';

class ProfileUser extends StatefulWidget {
  const ProfileUser({
    super.key,
    this.username,
    this.userId,
    required this.imageUrl
  });

  final String? username;
  final String? userId;
  final String imageUrl;

  @override
  State<ProfileUser> createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CircleAvatar(
              radius: 63,
              backgroundImage: NetworkImage(widget.imageUrl),
              onBackgroundImageError: (_, __) {
                // Обработка ошибки загрузки изображения
              },
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.username ?? '',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'User ID: ${widget.userId ?? ''}',
                      style: const TextStyle(
                        color: Color(0xFFA4ACC3),
                        fontSize: 12,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFBE1257),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
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
                ),
              ),
            ),
            child: Container(
              height: 5.0,
            ),
          ),
          const SizedBox(height: 10),
          BaseLongButton(
            onPressed: () async =>
              await context.router.push(const FavoriteCoursesRoute()),
            title: 'Отслеживаемые курсы',
            textColor: Colors.white,
          ),
          BaseLongButton(
            onPressed: () async =>
              await context.router.push(const CompletedCourseRoute()),
            title: 'Пройденные курсы',
            textColor: Colors.white,
          ),
          BaseLongButton(
            onPressed: () async =>
              await context.router.push(const EditorRoute()),
            title: 'Создать курсы',
            textColor: Colors.white,
          ),
          // BaseLongButton(
          //   onPressed: () async =>
          //     await context.router.push(const MyCoursesRoute()),
          //   title: 'Созданные мной курсы',
          //   textColor: Colors.white,
          // ),
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
              isAuthorized = false;
              context.router.push(const NoauthProfileRoute());
            },
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
