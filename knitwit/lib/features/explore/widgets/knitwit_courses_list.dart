import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:knitwit/features/auth/bloc/auth_bloc.dart';
import 'package:knitwit/router/router.dart';

class KnitwitCoursesList extends StatefulWidget {
  final String nameCourse;
  final String imagePath;
  final int courseId;
  final bool isSelected;
  final VoidCallback onCourseSelected;
  final List<String> tags;

  const KnitwitCoursesList({
    super.key,
    required this.nameCourse,
    required this.imagePath,
    required this.courseId,
    required this.isSelected,
    required this.onCourseSelected,
    required this.tags,
  });

  @override
  State<KnitwitCoursesList> createState() => _KnitwitCoursesListState();
}

class _KnitwitCoursesListState extends State<KnitwitCoursesList> {
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
          if(isAuthorized == true) {
            widget.onCourseSelected();
            context.router.push(CourseRoute(selectedCourseId: widget.courseId));
          } else {
            context.router.push(const GuardRoute());
          }
          
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      widget.imagePath,
                      width: 64,
                      height: 64,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.nameCourse,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: widget.tags.map((tag) => Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                            decoration: BoxDecoration(
                              color: const Color(0xFF404040),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Text(
                              tag,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFA4ACC3),
                              ),
                            ),
                          )).toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
