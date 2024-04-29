import 'package:auto_route/auto_route.dart';
import 'package:knitwit/router/explore_routes.dart';
import 'package:knitwit/router/profile_routes.dart';

import '../features/completedCourses/view/completed_courses_screen.dart';
import '../features/course/view/course_screen.dart';
import '../features/editor/view/editor_screen.dart';
import '../features/explore/view/explore_screen.dart';
import '../features/favoriteCourses/view/favorite_courses_screen.dart';
import '../features/first/view/first_screen.dart';
import '../features/first/view/first_wrapper_screen.dart';
import '../features/home/view/home_screen.dart';
import '../features/module/view/module_screen.dart';
import '../features/myCourses/view/my_courses_screen.dart';
import '../features/notifications/view/notifications_screen.dart';
import '../features/profile/view/profile_screen.dart';
import '../features/explore/view/explore_wrapper_screen.dart';
import '../features/profile/view/profile_wrapper_screen.dart';
import '../features/profileRedact/view/profile_redact_screen.dart';
import '../features/settings/view/settings_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: HomeRoute.page,
      path: '/',
      initial: true,
      children: [
        AutoRoute(
          page: FirstRoute.page,
          path: 'first',
        ),
        ExploreRoutes.routes,
        ProfileRoutes.routes
      ]
    )
  ];
}