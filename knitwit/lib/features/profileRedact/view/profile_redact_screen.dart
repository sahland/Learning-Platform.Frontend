import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:knitwit/features/profileRedact/widgets/redact_window.dart';

import '../../../common/widgets/knitwit_title.dart';

@RoutePage()
class ProfileRedactScreen extends StatelessWidget {
  const ProfileRedactScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
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
          const SliverToBoxAdapter(
            child: RedactWindow(),
          )
        ],
      ),
    );
  }
}