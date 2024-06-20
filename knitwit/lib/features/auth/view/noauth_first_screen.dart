import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:knitwit/features/auth/widgets/widgets.dart';

@RoutePage()
class NoAuthFirstScreen extends StatefulWidget {
  const NoAuthFirstScreen({super.key});

  @override
  State<NoAuthFirstScreen> createState() => _NoAuthFirstScreenState();
}

class _NoAuthFirstScreenState extends State<NoAuthFirstScreen> {
   @override
  Widget build(BuildContext context){
    AppMetrica.reportEvent('Viewing the no auth first screen');
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
             title: const Text(
               'Главная',
               style: TextStyle(
                 color: Color(0xFFA4ACC3),
                 fontSize: 20,
                 fontFamily: 'Roboto',
                 fontWeight: FontWeight.w500,
                 height: 0
               ),
             ),
            elevation: 0,
          ),
          const SliverToBoxAdapter(
              child: AuthButton(),
          ),
          const SliverToBoxAdapter(
            child: NoAuthLastCourseBox()
          ),
          const SliverToBoxAdapter(
            child: NoAuthLowBox(),
          )
        ],
      ),
    );
  }
}
