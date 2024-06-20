import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:knitwit/common/widgets/widgets.dart';
import 'package:knitwit/features/auth/widgets/widgets.dart';

@RoutePage()
class NoauthProfileScreen extends StatefulWidget {
  const NoauthProfileScreen({super.key});

  @override
  State<NoauthProfileScreen> createState() => _NoauthProfileScreenState();
}

class _NoauthProfileScreenState extends State<NoauthProfileScreen> {
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
            centerTitle: true,
            leading: null,
            title: const KnitwitTitle(title: 'Мой профиль'),
            elevation: 4,
          ),
          const SliverToBoxAdapter(
            child: ProfileUser(),
          ),
          const SliverToBoxAdapter(
            child: AuthButton(),
          )
        ],
      ),
    );
  }
}