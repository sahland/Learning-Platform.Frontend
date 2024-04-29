import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:knitwit/features/knitwit_title.dart';

@RoutePage()
class MyCoursesScreen extends StatelessWidget {
  const MyCoursesScreen({super.key});

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
            title: const KnitwitTitle(title: 'title'),
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

        ],
      ),
    );
  }
}