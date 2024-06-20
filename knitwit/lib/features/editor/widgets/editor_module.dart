import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../router/router.dart';

class CourseModule extends StatefulWidget {
  final VoidCallback onDelete;

  const CourseModule({
    super.key,
    required this.onDelete,
  });

  @override
  State<CourseModule> createState() => _CourseModuleState();
}

class _CourseModuleState extends State<CourseModule> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      elevation: 0,
      color: const Color(0xFF000000).withOpacity(0.25),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        child: Row(
          children: [
            const Text(
              'widget.moduleName',
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                context.router.push(const RedactModuleRoute());
              },
              icon: SvgPicture.asset('./assets/icons/edit_icon.svg'),
            ),
            const SizedBox(width: 10),
            IconButton(
              onPressed: widget.onDelete,
              icon: SvgPicture.asset('./assets/icons/delete_icon.svg'),
            ),
          ],
        ),
      ),
    );
  }
}
