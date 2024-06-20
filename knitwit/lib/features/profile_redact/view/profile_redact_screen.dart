import 'dart:async';
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:knitwit/api/api.dart';
import '../../../common/common.dart';
import '../bloc/bloc.dart';
import '../widgets/widgets.dart';

@RoutePage()
class ProfileRedactScreen extends StatefulWidget {
  const ProfileRedactScreen({super.key});

  @override
  State<ProfileRedactScreen> createState() => _ProfileRedactScreenState();
}

class _ProfileRedactScreenState extends State<ProfileRedactScreen> {
  @override
  void initState() {
    BlocProvider.of<ProfileRedactBloc>(context).add(const ProfileRedactLoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocListener<ProfileRedactBloc, ProfileRedactState>(
      listener: (context, state) {
        if (state is ProfileRedactFailureState) {
          _refreshToken(context);
        }
      },
      child: BlocBuilder<ProfileRedactBloc, ProfileRedactState>(
        builder: (context, state) {
          if (state is ProfileRedactLoadedState) {
            final user = state.user;
            return _buildContext(user, theme, context);
          } else if (state is ProfileRedactFailureState) {
            return const Center(
              child: Text(
                'Ошибка загрузки редактора профиля',
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
                automaticallyImplyLeading: false,
                title: const KnitwitTitle(title: 'Редактировать профиль'),
                leading: IconButton(
                  onPressed: () {
                    context.router.maybePop();
                  },
                  icon: SvgPicture.asset('./assets/icons/arrow_left_icon.svg'),
                ),
                actions: const [
                  SizedBox(width: 50, height: 50,)
                ],
                elevation: 4,
              ),
              SliverToBoxAdapter(
                child: RedactWindow(
                  username: user.nickname,
                  imageUrl: user.avatarKey != null ? 'http://knitwit.ru:9000/knitwit/${user.avatarKey.toString()}' : 'http://knitwit.ru:9000/knitwit/user_avatars/standart_avatar.png',
                ),
              )
            ],
          ),
        )
      );
    }

  Scaffold _buildLoading() => const Scaffold(
    body: Center(
      child: CircularProgressIndicator(
        color: Color(0xFFFBE1257),
      ),
    ),
  );

  void _refreshToken(BuildContext context) {
    final profileRedactBloc = BlocProvider.of<ProfileRedactBloc>(context);
    profileRedactBloc.add(const ProfileRedactLoadEvent());
  }

  Future<void> _refreshScreen(BuildContext context) async {
    final profileRedactBloc = BlocProvider.of<ProfileRedactBloc>(context);
    final completer = Completer();
    profileRedactBloc.add(ProfileRedactLoadEvent(
      completer: completer
    ));
    await completer.future;
  }
}