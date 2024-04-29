import 'package:flutter/material.dart';

class CourseTitle extends StatefulWidget {
  const CourseTitle({
    super.key,
    required this.percentCompleted
  });

  final double percentCompleted;

  @override
  State<CourseTitle> createState() => _CourseTitleState();
}

class _CourseTitleState extends State<CourseTitle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Center(
          child: Text(
            'Завершено  ${(widget.percentCompleted * 100).toInt()}%',
            style: const TextStyle(
              color: Color(0xFFA4ACC3),
              fontSize: 20,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 5),
        LinearProgressIndicator(
          minHeight: 16,
          borderRadius: BorderRadius.circular(22),
          value: widget.percentCompleted,
          color: const Color(0xFF48DFC4),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}