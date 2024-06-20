import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:knitwit/features/course/bloc/bloc.dart';
import '../../../api/api.dart';
import '../widgets/widgets.dart';

@RoutePage()
class CourseScreen extends StatefulWidget {
  const CourseScreen({
    super.key,
    required this.selectedCourseId
  });

  final int selectedCourseId;

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  void initState() {
    BlocProvider.of<CourseBloc>(context).add(FetchCourseByIdEvent(courseId: widget.selectedCourseId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocListener<CourseBloc, CourseState>(
      listener: (context, state) {
        if(state is CourseFailureState) {
          _refreshToken(context);
        }
      },
      child: BlocBuilder<CourseBloc, CourseState> (
        builder: (context, state) {
          if(state is CourseLoadedState){
            final course = state.course;
            final tags = state.course.tags;
            return _buildContext(course, tags, state.isSubscribed, theme);
          } else if (state is CourseFailureState) {
            return const Center(
              child: Text(
                'Ошибка загрузки страницы курса',
                style: TextStyle(color: Colors.red),
              ),
            );
          }
          return _buildLoading();
        },
      ),
    );
  }

  Scaffold _buildContext(Course course, List<Tag> courseTags, bool isSubscribed, ThemeData theme) {
    // Преобразование List<Tag> в List<String>
    final List<String> tagNames = courseTags.map((tag) => tag.tagName).toList();

    return Scaffold(
      body: RefreshIndicator(
        color: Colors.white,
        backgroundColor: const Color(0xFFFBE1257),
        onRefresh: () async {
          _refreshScreen(context);
        },
        child: CustomScrollView(
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
                const SizedBox(width: 50, height: 50)
              ],
              backgroundColor: theme.primaryColor,
            ),
            SliverToBoxAdapter(
              child: CourseInfo(
                percentCompleted: 0.54,
                tags: tagNames, // Использование преобразованных тегов
                courseName: course.title,
                author: course.creator.nickname,
                courseId: course.courseId,
              )
            ),
            SliverList.builder(
              itemBuilder: (context, index) => CourseModules(
                moduleName: course.sections[index].title,
                moduleId: course.sections[index].sectionId,
                courseId: course.courseId,
              ),
              itemCount: course.sections.length,
            )
          ],
        ),
      )
    );
  }

  Scaffold _buildLoading() => const Scaffold(
    body: Center(
      child: CircularProgressIndicator(
        color: Color(0xFFFBE1257),
      ),
    ),
  );

  void _refreshToken(BuildContext context){
    final courseBloc = BlocProvider.of<CourseBloc>(context); 
    courseBloc.add(FetchCourseByIdEvent(courseId: widget.selectedCourseId));
  }

  Future<void> _refreshScreen(BuildContext context) async {
    final courseBloc = BlocProvider.of<CourseBloc>(context);
    final completer = Completer();
    courseBloc.add(FetchCourseByIdEvent(
        courseId: widget.selectedCourseId,
        completer: completer
    ));
    await completer.future;
  }
}


