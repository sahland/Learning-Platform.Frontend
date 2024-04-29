import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:knitwit/features/course/widgets/course_info.dart';
import 'package:knitwit/features/course/widgets/course_modules.dart';
import 'package:knitwit/features/course/widgets/course_title.dart';

@RoutePage()
class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final List<String> courseTags = [
      'Tag',
      'Tag',
      'Tag',
      'Tag',
    ];

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
            title: const CourseTitle(percentCompleted: 0.54),
            leading: IconButton(
              onPressed: ()  {
                context.router.maybePop();
              },
              icon: SvgPicture.asset('./assets/icons/arrow_left_icon.svg'),
            ),
            actions: [
              SizedBox(width: 50, height: 50)
            ],
            backgroundColor: theme.primaryColor,
          ),
          SliverToBoxAdapter(
            child: CourseInfo(
              tags: courseTags,
              courseName: 'Figma ipsum component variant main layer. Follower clip asset layer outline asset.',
              author: 'Username',
            )
          ),
          SliverList.builder(
            itemBuilder: (context, index) => const CourseModules(module: 1, chapter: 1)
          )
        ],
      ),
    );
  }
}