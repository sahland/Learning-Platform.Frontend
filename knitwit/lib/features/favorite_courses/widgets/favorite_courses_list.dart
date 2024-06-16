import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../router/router.dart';

class FavoriteCoursesList extends StatelessWidget {
  final String nameCourse;
  final String imagePath;
  final double percentCompleted;

  const FavoriteCoursesList({
    super.key,
    required this.nameCourse,
    required this.imagePath,
    required this.percentCompleted
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 4,
      color: theme.primaryColor,
      margin: const EdgeInsets.all(5),
      child: GestureDetector(
        onTap: () {
          context.router.push(const CourseRoute());
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column (
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      imagePath,
                      width: 64,
                      height: 64,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                      child: Column (
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            nameCourse,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(left: 2, right: 5),
                            child: LinearProgressIndicator(
                              minHeight: 6,
                              borderRadius: BorderRadius.circular(22),
                              value: percentCompleted,
                              color: const Color(0xFF48DFC4),
                            ),
                          )
                        ],
                      )
                  )
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}