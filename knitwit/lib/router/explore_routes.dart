import 'package:auto_route/auto_route.dart';
import 'package:knitwit/router/router.dart';

class CatalogRoutes {
  static final routes = AutoRoute(
    page: CourseRoute.page,
    children: [
      AutoRoute(
        page: ExploreRoute.page,
        initial: true,
      ),
    ]
  );
}