import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../common/common.dart';
import '../widgets/widgets.dart';

@RoutePage()
class EditorScreen extends StatelessWidget {
  const EditorScreen({super.key});

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
            automaticallyImplyLeading: false,
            title: const KnitwitTitle(title: 'Редактировать курс'),
            leading: IconButton(
              onPressed: () {
                context.router.maybePop();
              },
              icon: SvgPicture.asset('./assets/icons/arrow_left_icon.svg'),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  './assets/icons/check_icon.svg',
                ),
                color: Colors.white,
              )
            ],
            backgroundColor: theme.primaryColor,
          ),
          SliverList.builder(
            itemBuilder: (context, index) => const EditorInfo(
                miniImage: "./assets/images/test_image_mini.jpg",
                nameCourse:
                    "Figma ipsum component variant main layer. Follower clip asset layer outline asset."),
            itemCount: 1,
          ),
          const SliverToBoxAdapter(
            child: EditorButtons(),
          ),
          SliverList.builder(
            itemBuilder: (context, index) => const EditorAddModule(),
            itemCount: 1,
          ),
        ],
      ),
    );
  }
}