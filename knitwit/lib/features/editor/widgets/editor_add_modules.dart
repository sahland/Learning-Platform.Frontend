import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:knitwit/features/editor/widgets/editor_module.dart';

class EditorAddModule extends StatelessWidget {
  const EditorAddModule({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        children: [
          Row(
          children: [
            const Text(
              'Модули',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF404040),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(73),
                ),
              ),
              onPressed: () {},
              child: Row(
                  children: [
                    Text(
                      'Создать',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500
                      ),
                      ),
                      SizedBox(width: 10),
                      SvgPicture.asset('./assets/icons/plus_icon.svg')
                  ],
                ),
            ),
          ],
        ),
        const CourseModule(),
        const CourseModule(),
        const CourseModule(),
        const CourseModule(),
        const CourseModule(),
        const CourseModule(),
        const CourseModule(),
        const CourseModule(),
        const CourseModule(),

        ]
      )
    );
  }
}
