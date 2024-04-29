import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:knitwit/features/knitwit_title.dart';

@RoutePage()
class CompletedCourseScreen extends StatelessWidget {
  const CompletedCourseScreen({super.key})
  
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
            title: const KnitwitTitle(title: 'Законченные курсы'),
            leading: IconButton(
              onPressed: () {
                context.router.maybePop();
              },
              icon: SvgPicture.asset('./assets/icons/arrow_left_icon.svg'),
            ),
            backgroundColor: theme.primaryColor,
            actions: [
              SizedBox(width: 50, height: 50)
            ],
          ),
          SliverList.builder(
              itemBuilder: (context, index) => Scaffold()
          )
        ],
      ),
    );
  }
}