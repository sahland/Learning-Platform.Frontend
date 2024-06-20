import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:knitwit/router/explore_routes.dart';
import 'package:knitwit/router/profile_routes.dart';

import '../features/features.dart';
import 'first_routes.dart';

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
        FirstRoutes.routes,
        ExploreRoutes.routes,
        ProfileRoutes.routes
      ]
    ),
    AutoRoute(page: AuthRoute.page, path: '/auth'),
    AutoRoute(page: RegisterRoute.page, path: '/register'),
    AutoRoute(page: GuardRoute.page, path: '/guard')
  ];
}