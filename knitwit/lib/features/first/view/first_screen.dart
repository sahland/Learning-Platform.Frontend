import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:knitwit/features/first/widgets/favorites_button.dart';
import 'package:knitwit/features/first/widgets/last_course_box.dart';
import 'package:knitwit/features/first/widgets/low_box.dart';

@RoutePage()
class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context){
    final theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
             pinned: false,
             snap: false,
             floating: false,
             expandedHeight: 75,
             backgroundColor: theme.primaryColor,
             centerTitle: true,
             title: const Text(
               'Главная',
               style: TextStyle(
                 color: Color(0xFFA4ACC3),
                 fontSize: 20,
                 fontFamily: 'Roboto',
                 fontWeight: FontWeight.w500,
                 height: 0
               ),
             ),
            elevation: 0,
          ),
          const SliverToBoxAdapter(
              child: FavoriteButton(),
          ),
          const SliverToBoxAdapter(
            child: LastCourseBox(
                imagePath: './assets/images/test_image_2.jpg',
                courseTitle: "Figma ipsum component variant main layer. Follower clip asset layer outline asset.",
                progress: 0.54,
            )
          ),
          const SliverToBoxAdapter(
            child: LowBox(),
          )
        ],
      ),
    );
  }
}