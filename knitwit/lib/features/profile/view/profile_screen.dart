import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:knitwit/features/knitwit_title.dart';
import 'package:knitwit/features/profile/widgets/profile_user.dart';
import 'package:knitwit/router/router.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context){
    final theme = Theme.of(context);

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
              },
              icon: SvgPicture.asset(
                './assets/icons/arrow_left_icon.svg',
              ),
              color: Colors.white,
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    context.router.push(const NotificationsRoute());
                  },
                icon: SvgPicture.asset(
                  './assets/icons/mail_icon.svg',
                ),
                color: Colors.white,
              )
            ],
            elevation: 4,
          ),
          const SliverToBoxAdapter(
            child:
            UserProfile(),
          ),
        ],
      ),
    );
  }
}