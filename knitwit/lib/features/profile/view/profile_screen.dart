import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:knitwit/features/profile/widgets/profile_user.dart';
import 'package:knitwit/router/router.dart';

import '../../../common/widgets/knitwit_title.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context){
    final theme = Theme.of(context);
    AppMetrica.reportEvent('Viewing the profile');

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            snap: false,
            floating: false,
            expandedHeight: 75,
            backgroundColor: theme.primaryColor,
            centerTitle: true,
            title: const KnitwitTitle(title: 'Мой профиль'),
            leading: IconButton(
              onPressed: () {
                context.router.push(const NotificationsRoute());
              },
              icon: SvgPicture.asset(
                './assets/icons/bell_icon.svg',
              ),
              color: Colors.white,
            ),
            actions: [
              IconButton(
                onPressed: () {
                  context.router.push(const SettingsRoute());
                },
                icon: SvgPicture.asset(
                  './assets/icons/settings_icon.svg',
                ),
                color: Colors.white,
              ),
            ],
            elevation: 4,
          ),
           SliverToBoxAdapter(
            child: ProfileUsers(),
          ),
        ],
      ),
    );
  }
}