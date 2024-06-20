// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AuthRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthScreen(),
      );
    },
    CompletedCourseRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CompletedCourseScreen(),
      );
    },
    CourseRoute.name: (routeData) {
      final args = routeData.argsAs<CourseRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CourseScreen(
          key: args.key,
          selectedCourseId: args.selectedCourseId,
        ),
      );
    },
    EditorRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EditorScreen(),
      );
    },
    ExploreRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ExploreScreen(),
      );
    },
    ExploreWrapperRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const ExploreWrapperScreen()),
      );
    },
    FavoriteCoursesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FavoriteCoursesScreen(),
      );
    },
    FirstRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FirstScreen(),
      );
    },
    FirstWrapperRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const FirstWrapperScreen()),
      );
    },
    GuardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const GuardScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    ModuleRoute.name: (routeData) {
      final args = routeData.argsAs<ModuleRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ModuleScreen(
          key: args.key,
          selectedSectionId: args.selectedSectionId,
          selectedCourseId: args.selectedCourseId,
        ),
      );
    },
    MyCoursesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MyCoursesScreen(),
      );
    },
    NoAuthFirstRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NoAuthFirstScreen(),
      );
    },
    NoauthProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NoauthProfileScreen(),
      );
    },
    NotificationsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NotificationsScreen(),
      );
    },
    ProfileRedactRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileRedactScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileScreen(),
      );
    },
    ProfileWrapperRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const ProfileWrapperScreen()),
      );
    },
    RedactModuleRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RedactModuleScreen(),
      );
    },
    RegisterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RegisterScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
  };
}

/// generated route for
/// [AuthScreen]
class AuthRoute extends PageRouteInfo<void> {
  const AuthRoute({List<PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CompletedCourseScreen]
class CompletedCourseRoute extends PageRouteInfo<void> {
  const CompletedCourseRoute({List<PageRouteInfo>? children})
      : super(
          CompletedCourseRoute.name,
          initialChildren: children,
        );

  static const String name = 'CompletedCourseRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CourseScreen]
class CourseRoute extends PageRouteInfo<CourseRouteArgs> {
  CourseRoute({
    Key? key,
    required int selectedCourseId,
    List<PageRouteInfo>? children,
  }) : super(
          CourseRoute.name,
          args: CourseRouteArgs(
            key: key,
            selectedCourseId: selectedCourseId,
          ),
          initialChildren: children,
        );

  static const String name = 'CourseRoute';

  static const PageInfo<CourseRouteArgs> page = PageInfo<CourseRouteArgs>(name);
}

class CourseRouteArgs {
  const CourseRouteArgs({
    this.key,
    required this.selectedCourseId,
  });

  final Key? key;

  final int selectedCourseId;

  @override
  String toString() {
    return 'CourseRouteArgs{key: $key, selectedCourseId: $selectedCourseId}';
  }
}

/// generated route for
/// [EditorScreen]
class EditorRoute extends PageRouteInfo<void> {
  const EditorRoute({List<PageRouteInfo>? children})
      : super(
          EditorRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditorRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ExploreScreen]
class ExploreRoute extends PageRouteInfo<void> {
  const ExploreRoute({List<PageRouteInfo>? children})
      : super(
          ExploreRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExploreRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ExploreWrapperScreen]
class ExploreWrapperRoute extends PageRouteInfo<void> {
  const ExploreWrapperRoute({List<PageRouteInfo>? children})
      : super(
          ExploreWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExploreWrapperRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FavoriteCoursesScreen]
class FavoriteCoursesRoute extends PageRouteInfo<void> {
  const FavoriteCoursesRoute({List<PageRouteInfo>? children})
      : super(
          FavoriteCoursesRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoriteCoursesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FirstScreen]
class FirstRoute extends PageRouteInfo<void> {
  const FirstRoute({List<PageRouteInfo>? children})
      : super(
          FirstRoute.name,
          initialChildren: children,
        );

  static const String name = 'FirstRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FirstWrapperScreen]
class FirstWrapperRoute extends PageRouteInfo<void> {
  const FirstWrapperRoute({List<PageRouteInfo>? children})
      : super(
          FirstWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'FirstWrapperRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [GuardScreen]
class GuardRoute extends PageRouteInfo<void> {
  const GuardRoute({List<PageRouteInfo>? children})
      : super(
          GuardRoute.name,
          initialChildren: children,
        );

  static const String name = 'GuardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ModuleScreen]
class ModuleRoute extends PageRouteInfo<ModuleRouteArgs> {
  ModuleRoute({
    Key? key,
    required int selectedSectionId,
    required int selectedCourseId,
    List<PageRouteInfo>? children,
  }) : super(
          ModuleRoute.name,
          args: ModuleRouteArgs(
            key: key,
            selectedSectionId: selectedSectionId,
            selectedCourseId: selectedCourseId,
          ),
          initialChildren: children,
        );

  static const String name = 'ModuleRoute';

  static const PageInfo<ModuleRouteArgs> page = PageInfo<ModuleRouteArgs>(name);
}

class ModuleRouteArgs {
  const ModuleRouteArgs({
    this.key,
    required this.selectedSectionId,
    required this.selectedCourseId,
  });

  final Key? key;

  final int selectedSectionId;

  final int selectedCourseId;

  @override
  String toString() {
    return 'ModuleRouteArgs{key: $key, selectedSectionId: $selectedSectionId, selectedCourseId: $selectedCourseId}';
  }
}

/// generated route for
/// [MyCoursesScreen]
class MyCoursesRoute extends PageRouteInfo<void> {
  const MyCoursesRoute({List<PageRouteInfo>? children})
      : super(
          MyCoursesRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyCoursesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NoAuthFirstScreen]
class NoAuthFirstRoute extends PageRouteInfo<void> {
  const NoAuthFirstRoute({List<PageRouteInfo>? children})
      : super(
          NoAuthFirstRoute.name,
          initialChildren: children,
        );

  static const String name = 'NoAuthFirstRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NoauthProfileScreen]
class NoauthProfileRoute extends PageRouteInfo<void> {
  const NoauthProfileRoute({List<PageRouteInfo>? children})
      : super(
          NoauthProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'NoauthProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NotificationsScreen]
class NotificationsRoute extends PageRouteInfo<void> {
  const NotificationsRoute({List<PageRouteInfo>? children})
      : super(
          NotificationsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileRedactScreen]
class ProfileRedactRoute extends PageRouteInfo<void> {
  const ProfileRedactRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRedactRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRedactRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileWrapperScreen]
class ProfileWrapperRoute extends PageRouteInfo<void> {
  const ProfileWrapperRoute({List<PageRouteInfo>? children})
      : super(
          ProfileWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileWrapperRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RedactModuleScreen]
class RedactModuleRoute extends PageRouteInfo<void> {
  const RedactModuleRoute({List<PageRouteInfo>? children})
      : super(
          RedactModuleRoute.name,
          initialChildren: children,
        );

  static const String name = 'RedactModuleRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegisterScreen]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute({List<PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
