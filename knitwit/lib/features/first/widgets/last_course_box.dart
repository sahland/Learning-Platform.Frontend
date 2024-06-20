import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../router/router.dart';

class LastCourseBox extends StatefulWidget {
  const LastCourseBox({
    super.key,
    required this.imagePath,
    required this.courseTitle,
    required this.progress,
  });

  final String imagePath;
  final String courseTitle;
  final double progress;

  @override
  State<LastCourseBox> createState() => _LastCourseBoxState();
}

class _LastCourseBoxState extends State<LastCourseBox> {

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 4,
      margin: const EdgeInsets.all(20),
      color: const Color(0xFF181818),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.0), // Скруглить углы на 10 пикселей
                        child: Image.asset(
                          widget.imagePath,
                          width: 96,
                          height: 96,
                          fit: BoxFit.cover,
                        ),
                      ),
                        const SizedBox(width: 10),
                        Flexible(
                          flex: 1, // Занимает оставшееся место
                          child: Text(
                            widget.courseTitle,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                    ),
                  ),
                ]
              ),
            ),
            const SizedBox(height: 5),
            LinearProgressIndicator(
                minHeight: 10,
                value: widget.progress,
                color: const Color(0xFF49DFC4),
              ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                    child: Text(
                      'Модуль 1, Раздел 5',
                      style: TextStyle(
                        color: Color(0xFF7D8495),
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                ),
                ElevatedButton(
                    onPressed: () {
                      //context.router.push(const ModuleRoute());
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        )
                    ),
                    child: const Text(
                        'Вернуться',
                        style: TextStyle(
                          color: Color(0xFFBE1257),
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                    )
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}