import 'package:auto_route/auto_route.dart';
import 'package:knitwit/router/router.dart';

class ExploreRoutes {
  static final routes = AutoRoute(
    page: ExploreWrapperRoute.page,
    children: [
      AutoRoute(
        page: ExploreRoute.page,
        initial: true,
      ),
      AutoRoute(page: CourseRoute.page),
      AutoRoute(page: ModuleRoute.page),
    ]
  );
}