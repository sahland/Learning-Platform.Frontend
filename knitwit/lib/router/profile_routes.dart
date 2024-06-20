import 'package:auto_route/auto_route.dart';
import 'package:knitwit/router/router.dart';

class ProfileRoutes {
  static final routes = AutoRoute(
    page: ProfileWrapperRoute.page,
    children: [
      AutoRoute(
          page: ProfileRoute.page,
          initial: true,
      ),
      AutoRoute(page: SettingsRoute.page),
      AutoRoute(page: FavoriteCoursesRoute.page),
      AutoRoute(page: CompletedCourseRoute.page),
      AutoRoute(page: EditorRoute.page),
      AutoRoute(page: ProfileRedactRoute.page),
      AutoRoute(page: CourseRoute.page),
      AutoRoute(page: ModuleRoute.page),
      AutoRoute(page: MyCoursesRoute.page),
      AutoRoute(page: NotificationsRoute.page),
      AutoRoute(page: RedactModuleRoute.page),
      AutoRoute(page: NoauthProfileRoute.page),
    ]
  );
}