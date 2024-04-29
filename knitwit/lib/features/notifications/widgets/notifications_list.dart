import 'package:flutter/material.dart';

class NotificationsList extends StatelessWidget {
  final String information;
  final String imagePath;

  const NotificationsList({
    super.key,
    required this.information,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 4,
      color: theme.primaryColor,
      margin: const EdgeInsets.all(5),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column (
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                    imagePath
                ),

                const SizedBox(width: 10),
                Expanded(
                    child: Column (
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          information,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    )
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}