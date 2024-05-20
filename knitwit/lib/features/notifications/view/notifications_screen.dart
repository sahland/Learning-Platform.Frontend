import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:knitwit/features/notifications/widgets/notifications_list.dart';

import '../../../common/widgets/knitwit_title.dart';

@RoutePage()
class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            snap: true,
            floating: true,
            elevation: 0,
            expandedHeight: 65,
            title: const KnitwitTitle(title: 'Уведомления'),
            leading: IconButton(
              onPressed: () {
                context.router.maybePop();
              },
              icon: SvgPicture.asset('./assets/icons/arrow_left_icon.svg'),
            ),
            backgroundColor: theme.primaryColor,
            actions: const [
              SizedBox(width: 50, height: 50)
            ],
          ),
          SliverList.builder(
              itemBuilder: (context, index) => const NotificationsList(
                information: 'Figma ipsum component variant main layer.',
                imagePath: './assets/images/knitwit_image.png',
              )
          )
        ],
      ),
    );
  }
}