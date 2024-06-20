import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationsList extends StatefulWidget {
  final String title;
  final String imagePath;
  final String message;
  final String createAt;

  const NotificationsList({
    super.key,
    required this.title,
    required this.imagePath,
    required this.message,
    required this.createAt
  });

  @override
  State<NotificationsList> createState() => _NotificationsListState();
}

class _NotificationsListState extends State<NotificationsList> {
  bool _isExpanded = false;

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
                        widget.imagePath
                    ),

                    const SizedBox(width: 10),
                    Expanded(
                        child: Column (
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Дата публикации: ${widget.createAt}',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFACACAC),
                              ),
                            ),
                          ],
                        )
                    ),
                    IconButton(
                        onPressed: () => setState(() => _isExpanded = !_isExpanded),
                        icon: SvgPicture.asset(
                          _isExpanded ? './assets/icons/arrow_up_icon.svg' : './assets/icons/arrow_down_icon.svg',
                          color: Colors.white,
                        ),
                      ),
                  ],
                ),
                AnimatedCrossFade(
                    firstChild: const SizedBox.shrink(),
                    secondChild: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                      ),
                      child: Text(
                        widget.message,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    duration: const Duration(milliseconds: 300),
                    crossFadeState: _isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                  ),
              ],
            ),
          ),
    );
  }
}

