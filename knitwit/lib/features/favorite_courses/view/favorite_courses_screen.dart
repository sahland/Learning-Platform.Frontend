import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:knitwit/features/favorite_courses/bloc/bloc.dart';
import '../../../common/common.dart';
import '../widgets/widgets.dart';

@RoutePage()
class FavoriteCoursesScreen extends StatefulWidget {
  const FavoriteCoursesScreen({super.key});

  @override
  State<FavoriteCoursesScreen> createState() => _FavoriteCoursesScreenState();
}

class _FavoriteCoursesScreenState extends State<FavoriteCoursesScreen> {
  @override
  void initState() {
    BlocProvider.of<FavoriteCourseBloc>(context).add(const SubscribedCoursesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: RefreshIndicator(
        color: Colors.white,
        backgroundColor: Color(0xFFFBE1257),
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
              title: const KnitwitTitle(title: 'Отслеживаемые курсы'),
              leading: IconButton(
                onPressed: ()  {
                  context.router.maybePop();
                },
                icon: SvgPicture.asset('./assets/icons/arrow_left_icon.svg'),
              ),
              backgroundColor: theme.primaryColor,
              actions: const [
                SizedBox(width: 50, height: 50)
              ],
            ),
            BlocBuilder<FavoriteCourseBloc, FavoriteCourseState>(
                builder: (context, state) {
                  if(state is FavoriteCourseLoadedState) {
                    return SliverList.builder(
                        itemBuilder: (context, index) => FavoriteCoursesList(
                          nameCourse: state.subscribedCourses[index].title ,
                          imagePath: 'http://knitwit.ru:9000/knitwit/${state.subscribedCourses[index].courseAvatarKey}',
                          percentCompleted: 0.54,
                        ),
                        itemCount: state.subscribedCourses.length,
                    );
                  }
                  return const SliverFillRemaining(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Color(0xFFFBE1257),
                      )
                    ),
                  );
                }
              )
          ],
        ),
      )
    );
  }

  Future<void> _refreshScreen(BuildContext context) async {
    final exploreBloc = BlocProvider.of<FavoriteCourseBloc>(context);
    final completer = Completer();
    exploreBloc.add(SubscribedCoursesEvent(completer: completer));
    await completer.future;
  }
}