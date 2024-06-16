import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../common/common.dart';
import '../widgets/widgets.dart';

@RoutePage()
class ModuleScreen extends StatefulWidget {
  const ModuleScreen({super.key});

  @override
  State<ModuleScreen> createState() => _ModuleScreenState();
}

class _ModuleScreenState extends State<ModuleScreen> {
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
            title: const KnitwitTitle(title:'Модуль 1, Раздел 1'),
            leading: IconButton(
              onPressed: ()  {
                context.router.maybePop();
              },
              icon: SvgPicture.asset('./assets/icons/arrow_left_icon.svg'),
            ),
            actions: const [
              SizedBox(width: 50, height: 50)
            ],
          ),
          const SliverToBoxAdapter(
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
