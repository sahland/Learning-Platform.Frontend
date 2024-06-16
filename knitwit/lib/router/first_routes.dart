import 'package:auto_route/auto_route.dart';
import 'package:knitwit/router/router.dart';

class FirstRoutes {
  static final routes = AutoRoute(
    page: FirstWrapperRoute.page,
    children: [
      AutoRoute(
        page: FirstRoute.page,
        initial: true,
      ),
      AutoRoute(page: FavoriteCoursesRoute.page),
      AutoRoute(page: CourseRoute.page),
      AutoRoute(page: ModuleRoute.page),
      AutoRoute(page: NoAuthFirstRoute.page),

    ]
  );
}