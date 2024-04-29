import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:knitwit/features/module/widgets/module_body.dart';
import 'package:knitwit/features/module/widgets/module_title.dart';

@RoutePage()
class ModuleScreen extends StatelessWidget {
  const ModuleScreen({super.key});

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
            expandedHeight: 75,
            automaticallyImplyLeading: false,
            backgroundColor: theme.primaryColor,
            title: ModuleTitle(
              percentCompleted: 0.12,
              titleName: 'Модуль 1, Раздел 1',
            ),
            leading: IconButton(
              onPressed: ()  {
                context.router.maybePop();
              },
              icon: SvgPicture.asset('./assets/icons/arrow_left_icon.svg'),
            ),
            actions: [
              SizedBox(width: 50, height: 50)
            ],
          ),
          SliverToBoxAdapter(
            child: ModuleBody(
              imagePath: './assets/images/test_image_2.jpg',
              moduleTitle: 'Заголовок',
            )
          )
        ],
      ),
    );
  }
}