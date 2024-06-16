import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../widgets/widgets.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
            title: const Center(
              child: Text(
                'Настройки',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFA3ABC3),
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ),
            leading: IconButton(
              onPressed: ()  {
                context.router.maybePop();
              },
              icon: SvgPicture.asset('./assets/icons/arrow_left_icon.svg'),
            ),
            backgroundColor: theme.primaryColor,
            actions: const [
              SizedBox(width: 50, height: 50)
            ],
          ),
          const SliverToBoxAdapter(
            child: SettingsNotifications(),
          )
        ],
      ),
    );
  }
}