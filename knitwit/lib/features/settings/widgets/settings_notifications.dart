import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingsNotifications extends StatefulWidget {
  const SettingsNotifications({super.key});

  @override
  State<SettingsNotifications> createState() => _SettingsNotificationsState();
}

class _SettingsNotificationsState extends State<SettingsNotifications> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.zero,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Уведомления KnitWit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Это отключит уведомления в системе',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF787878),
                      fontSize: 12,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                setState(() => isFavorite = !isFavorite);
              },
              icon: SvgPicture.asset('./assets/icons/bell2_icon.svg'),
              selectedIcon: SvgPicture.asset('./assets/icons/bell_icon.svg'),
              isSelected: isFavorite,
            ),
          ],
        ),
    );
  }
}