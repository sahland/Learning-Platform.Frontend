import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:knitwit/api/api.dart';
import 'package:knitwit/api/tags/tags_api_client.dart';
import 'package:knitwit/features/auth/bloc/auth_bloc.dart';
import 'package:knitwit/features/editor/bloc/bloc.dart';
import 'package:knitwit/features/explore/bloc/bloc.dart';
import 'package:knitwit/features/favorite_courses/bloc/bloc.dart';
import 'package:knitwit/features/module/bloc/module_bloc.dart';
import 'package:knitwit/features/notifications/bloc/bloc.dart';
import 'package:knitwit/features/profile/bloc/profile_bloc.dart';
import 'package:knitwit/features/profile_redact/bloc/profile_redact_bloc.dart';
import 'package:knitwit/router/router.dart';
import 'package:provider/provider.dart';

import 'common/common.dart';
import 'features/course/bloc/bloc.dart';
import 'features/explore/widgets/widgets.dart';

class KnitwitApp extends StatefulWidget {
  const KnitwitApp({super.key});

  @override
  State<KnitwitApp> createState() => _KnitwitAppState();
}

class _KnitwitAppState extends State<KnitwitApp> {
  final storage = const FlutterSecureStorage();
  final _router = AppRouter();
  final coursesApiClient = CoursesApiClient.create(apiUrl: dotenv.env['API_KEY']);
  final tagsApiClient = TagsApiClient.create(apiUrl: dotenv.env['API_KEY']);
  final courseRatingsApiClient = CourseRatingsApiClient.create(apiUrl: dotenv.env['API_KEY']);
  final learningProgressesApiClient = LearningProgressesApiClient.create(apiUrl: dotenv.env['API_KEY']);
  final notificationsApiClient = NotificationsApiClient.create(apiUrl: dotenv.env['API_KEY']);
  final usersApiClient = UsersApiClient.create(apiUrl: dotenv.env['API_KEY']);
  final authControllerApiClient = AuthControllerApiClient.create(apiUrl: dotenv.env['API_KEY']);

  @override
  Widget build(BuildContext context) {
    log('${dotenv.env['API_KEY']}');
    final primaryColor = Color(0xFF1C202A);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            final exploreBloc = ExploreBloc(
              coursesApiClient: coursesApiClient,
              tagsApiClient: tagsApiClient,
            );
            exploreBloc.add(const ExploreInit());
            return exploreBloc;
          },
        ),
        BlocProvider(
          create: (context) => NotificationBloc(
            notificationsApiClient: notificationsApiClient,
          ),
        ),
        BlocProvider(
          create: (context) => ProfileBloc(
            usersApiClient: usersApiClient,
            storage: storage,
          ),
        ),
        BlocProvider(
          create: (context) => ProfileRedactBloc(
            storage: storage,
            usersApiClient: usersApiClient
          ),
        ),
        BlocProvider(
          create: (context) => AuthBloc(
            authControllerApiClient: authControllerApiClient,
            usersApiClient: usersApiClient,
            storage: storage,
          ),
        ),
        BlocProvider(
          create: (context) => CourseBloc(
            courseApiClient: coursesApiClient,
            storage: storage
          )
        ),
        BlocProvider(
            create: (context) => FavoriteCourseBloc(
              usersApiClient: usersApiClient,
              coursesApiClient: coursesApiClient
            )
          ),
        BlocProvider(
          create: (context) => EditorBloc(
            coursesApiClient: coursesApiClient, 
            tagsApiClient: tagsApiClient,
            usersApiClient: usersApiClient
          ),
        ),
        BlocProvider(
          create: (context) => ModuleBloc(
            coursesApiClient: coursesApiClient, 
          ),
        ),
        MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => KnitwitTagNotifier()),
            ]
          ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'KnitWit',
        theme: ThemeData(
          primaryColor: primaryColor,
          scaffoldBackgroundColor: primaryColor,
          colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
          useMaterial3: true,
        ),
        routerConfig: _router.config(),
      ),

    );
  }
}
