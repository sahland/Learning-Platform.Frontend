import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:knitwit/router/router.dart';



/*
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
 */



@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AutoTabsRouter(
      duration: const Duration(milliseconds: 250),
      routes: const [
        FirstRoute(),
        ExploreWrapperRoute(),
        ProfileRoute()
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.blueGrey,
            unselectedItemColor: Colors.white,
            currentIndex: tabsRouter.activeIndex,
            backgroundColor: theme.primaryColor,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (index) => _openPage(index, tabsRouter),
            items:  [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  './assets/icons/home_icon.svg',
                ),
                activeIcon: SvgPicture.asset(
                  './assets/icons/home_icon.svg',
                  colorFilter: const ColorFilter.mode(Color(0xFFBE1257), BlendMode.srcIn),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  './assets/icons/compas_icon.svg',
                ),
                activeIcon: SvgPicture.asset(
                  './assets/icons/compas_icon.svg',
                  colorFilter: const ColorFilter.mode(Color(0xFFBE1257), BlendMode.srcIn),
                ),
                label: 'Каталог',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  './assets/icons/user_icon.svg',
                ),
                activeIcon: SvgPicture.asset(
                  './assets/icons/user_icon.svg',
                  colorFilter: const ColorFilter.mode(Color(0xFFBE1257), BlendMode.srcIn),
                ),
                label: 'Профиль',
              ),
            ],
          ),
        );
      },
    );
  }

  void _openPage(int index, TabsRouter tabsRouter) {
    tabsRouter.setActiveIndex(index);
  }
}
