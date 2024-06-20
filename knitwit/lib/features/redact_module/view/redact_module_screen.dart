import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:knitwit/common/common.dart';
import 'package:knitwit/features/redact_module/widgets/module_type.dart';

@RoutePage()
class RedactModuleScreen extends StatefulWidget {
  const RedactModuleScreen({super.key});

  @override
  State<RedactModuleScreen> createState() => _RedactModuleScreenState();
}

class _RedactModuleScreenState extends State<RedactModuleScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: RefreshIndicator(
        color: Colors.white,
        backgroundColor: Color(0xFFFBE1257),
        onRefresh: () async {
          _refreshScreen(context);
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              snap: true,
              floating: true,
              elevation: 0,
              expandedHeight: 65,
              title: const KnitwitTitle(title: 'Редактирование'),
              leading: IconButton(
                onPressed: () {
                  context.router.maybePop();
                },
                icon: SvgPicture.asset('./assets/icons/arrow_left_icon.svg'),
              ),
              backgroundColor: theme.primaryColor,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    './assets/icons/check_icon.svg',
                  ),
                  color: Colors.white,
                )
              ],
            ),
            const SliverToBoxAdapter(
              child: ModuleType(),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _refreshScreen(BuildContext context) async {

  }
}