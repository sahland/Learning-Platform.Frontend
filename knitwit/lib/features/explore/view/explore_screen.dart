import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:knitwit/features/explore/widgets/knitwit_courses_list.dart';
import 'package:knitwit/features/explore/widgets/knitwit_tag.dart';
import '../widgets/search_button.dart';

@RoutePage()
class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final List<Tag> tags = [
      Tag(text: 'Все'),
      Tag(text: 'Спорт'),
      Tag(text: 'Популярное'),
      Tag(text: 'Тег'),
      Tag(text: 'Тег'),
      Tag(text: 'Тег'),
      Tag(text: 'Тег'),
      Tag(text: 'Тег'),
    ];

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
              centerTitle: true,
              elevation: 0,
              expandedHeight: 75,
              backgroundColor: theme.primaryColor,
              bottom: const PreferredSize(
                child: SearchButton(),
                preferredSize: Size.fromHeight(60),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 28,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tags.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: TagButton(tag: tags[index]),
                    );
                  },
                ),
              ),
            ),
            SliverList.builder(
              itemBuilder: (context, index) => KnitwitCoursesList(
                  nameCourse: 'nameCourse',
                  imagePath: './assets/images/test_image_mini.jpg',
                  description: 'Description figma ipsum component variant main layer. Follower clip asset layer outline asset.',
                  tags: courseTags
              ),
            )
          ],
        )
    );
  }
}
