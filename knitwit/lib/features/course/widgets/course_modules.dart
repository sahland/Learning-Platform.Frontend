import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:knitwit/router/router.dart';

class CourseModules extends StatefulWidget {
  const CourseModules({
    super.key,
    required this.moduleName,
    required this.moduleId,
    required this.courseId
  });

  final String moduleName;
  final int moduleId;
  final int courseId;

  @override
  State<CourseModules> createState() => _CourseModulesState();
}

class _CourseModulesState extends State<CourseModules> {
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
        child: Row(
          children: [
            Text(
              '${widget.moduleName}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                context.router.push(ModuleRoute(
                  selectedSectionId: widget.moduleId,
                  selectedCourseId: widget.courseId
                ));
              },
              icon: SvgPicture.asset('./assets/icons/arrow_right_icon.svg'),
            ),
          ],
        ),
      ),
    );
  }
}