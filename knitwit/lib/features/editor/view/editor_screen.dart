import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../common/common.dart';
import '../widgets/widgets.dart';

@RoutePage()
class EditorScreen extends StatefulWidget {
  const EditorScreen({super.key});

  @override
  State<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const String _standartNameCourse = 'Новый курс';
    const String _standartCourseIconUrl = "http://knitwit.ru:9000/knitwit/course_avatars/standart_course_icon.png";

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            snap: true,
            floating: true,
            elevation: 0,
            expandedHeight: 65,
            automaticallyImplyLeading: false,
            title: const KnitwitTitle(title: 'Редактировать курс'),
            leading: IconButton(
              onPressed: () {
                context.router.maybePop();
              },
              icon: SvgPicture.asset('./assets/icons/arrow_left_icon.svg'),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  _showCreateCourseConfirmation(context);
                },
                icon: SvgPicture.asset(
                  './assets/icons/check_icon.svg',
                ),
                color: Colors.white,
              )
            ],
            backgroundColor: theme.primaryColor,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => const EditorInfo(
                miniImage: _standartCourseIconUrl,
                nameCourse: _standartNameCourse,
              ),
              childCount: 1,
            ),
          ),
          const SliverToBoxAdapter(
            child: EditorButtons(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => const EditorAddModule(),
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }

  void _showCreateCourseConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(
            child: Text(
              'Создание курса',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFBE1257),
                fontSize: 20,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          content: const Text(
            'Администрация рассмотрит вашу заявку на создание курса.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
            ),
          ),
          backgroundColor: Color(0xFFF1C202A),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}