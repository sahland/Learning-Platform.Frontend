import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:knitwit/features/my_courses/bloc/bloc.dart';
import 'package:knitwit/features/profile/bloc/bloc.dart';
import '../../../common/common.dart';
import '../widgets/widgets.dart';

@RoutePage()
class MyCoursesScreen extends StatefulWidget {
  const MyCoursesScreen({super.key});

  @override
  State<MyCoursesScreen> createState() => _MyCoursesScreenState();
}

class _MyCoursesScreenState extends State<MyCoursesScreen> {
  late MyCoursesBloc _myCoursesBloc;
  late String? _userId; // Меняем тип на String? для согласования с типом userId в ProfileScreen

  @override
  void initState() {
    //BlocProvider.of<MyCoursesBloc>(context).add(const GetUserCoursesEvent());
    super.initState();
  }

  @override
  void dispose() {
    _myCoursesBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: BlocProvider(
        create: (context) => _myCoursesBloc,
        child: BlocBuilder<MyCoursesBloc, MyCoursesState>(
          builder: (context, state) {
            if (state is MyCoursesLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MyCoursesLoadedState) {
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    snap: true,
                    floating: true,
                    elevation: 0,
                    expandedHeight: 65,
                    title: const KnitwitTitle(title: 'Мои курсы'),
                    leading: IconButton(
                      onPressed: () {
                        context.router.maybePop();
                      },
                      icon: SvgPicture.asset('./assets/icons/arrow_left_icon.svg'),
                    ),
                    backgroundColor: theme.primaryColor,
                    actions: const [
                      SizedBox(width: 50, height: 50)
                    ],
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final course = state.blocMyCourses[index];
                        return MyCoursesList(
                          nameCourse: course.title,
                          imagePath: 'http://knitwit.ru:9000/knitwit/${course.courseAvatarKey}',
                        );
                      },
                      childCount: state.blocMyCourses.length,
                    ),
                  )
                ],
              );
            } else if (state is MyCoursesFailureState) {
              return Center(child: Text('Failed to load courses: ${state.error}'));
            } else {
              return const Center(child: Text('No courses available'));
            }
          },
        ),
      ),
    );
  }
}
