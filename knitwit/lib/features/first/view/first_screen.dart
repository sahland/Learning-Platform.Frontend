import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

@RoutePage()
class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
   @override
  Widget build(BuildContext context){
    AppMetrica.reportEvent('Viewing the first screen');
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
              child: FavoriteButton(),
          ),
          const SliverToBoxAdapter(
            child: LastCourseBox(
                imagePath: './assets/images/test_image_mini.jpg',
                courseTitle: "Figma ipsum component variant main layer. Follower clip asset layer outline asset.",
                progress: 0.54,
            )
          ),
          const SliverToBoxAdapter(
            child: LowBox(),
          )
        ],
      ),
    );
  }
}
