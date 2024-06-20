import 'dart:async';

import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/svg.dart';
import 'package:knitwit/api/api.dart';
import 'package:knitwit/features/auth/bloc/auth_bloc.dart';
import 'package:knitwit/features/profile/bloc/bloc.dart';
import 'package:knitwit/features/profile/bloc/profile_bloc.dart';
import '../../../common/common.dart';
import 'package:knitwit/router/router.dart';
import '../widgets/widgets.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? _userId;

  @override
  void initState() {
    BlocProvider.of<ProfileBloc>(context).add(const ProfileLoadEvent());
    //BlocProvider.of<AuthBloc>(context).add(AuthLogoutEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    AppMetrica.reportEvent('Viewing the profile');

    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is ProfileFailure) {
          _refreshToken(context);
        }
      },
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoadedState) {
            final user = state.user;
            _userId = user.userId.toString();
            return _buildContext(user, theme, context);
          } else if (state is ProfileFailure) {
            return const Center(
              child: Text(
                'Ошибка загрузки профиля',
                style: TextStyle(color: Colors.red),
              ),
            );
          }
          return _buildLoading();
        },
      ),
    );
  }

  Scaffold _buildContext(User user, ThemeData theme, BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        color: Colors.white,
        backgroundColor: const Color(0xFFFBE1257),
        onRefresh: () async {
          _refreshScreen(context);
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: false,
              snap: false,
              floating: false,
              expandedHeight: 75,
              backgroundColor: theme.primaryColor,
              centerTitle: true,
              title: const Text(
                'Мой профиль',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFA3ABC3),
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  height: 1.2,
                ),
              ),
              leading: IconButton(
                onPressed: () {
                  context.router.push(const NotificationsRoute());
                },
                icon: SvgPicture.asset(
                  './assets/icons/bell_icon.svg',
                ),
                color: Colors.white,
              ),
              elevation: 4,
            ),
            SliverToBoxAdapter(
              child: ProfileUser(
                username: user.nickname,
                userId: user.userId.toString(),
                imageUrl: user.avatarKey != null ? 'http://knitwit.ru:9000/knitwit/${user.avatarKey.toString()}' : 'http://knitwit.ru:9000/knitwit/user_avatars/standart_avatar.png',
              ),
            ),
          ],
        ),
      ),
    );
  }

  String? getUserId() {
    return _userId;
  }

  Scaffold _buildLoading() => const Scaffold(
    body: Center(
      child: CircularProgressIndicator(
        color: Color(0xFFFBE1257),
      ),
    ),
  );

  void _refreshToken(BuildContext context) {
    final profileBloc = BlocProvider.of<ProfileBloc>(context);
    profileBloc.add(const ProfileLoadEvent());
  }

  Future<void> _refreshScreen(BuildContext context) async {
    final profileBloc = BlocProvider.of<ProfileBloc>(context);
    final completer = Completer();
    profileBloc.add(ProfileLoadEvent(
      completer: completer,
    ));
    await completer.future;
  }
}
