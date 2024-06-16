import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../router/router.dart';

class CourseModule extends StatefulWidget {
  const CourseModule({
    super.key,
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
                // Column(
                //   children: [
                //     IconButton(
                //     onPressed: () {},
                //      icon: SvgPicture.asset(
                //       './assets/icons/arrow_up_icon.svg',
                //       height: 16,
                //       width: 9,
                //      )
                //     ),
                //     IconButton(
                //     onPressed: () {},
                //      icon: SvgPicture.asset(
                //       './assets/icons/arrow_down_icon.svg',
                //       height: 16,
                //       width: 9,
                //      )
                //     ),
                //   ],
                // ),
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
                     icon: SvgPicture.asset(
                      './assets/icons/edit_icon.svg'
                     )
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                    onPressed: () {},
                     icon: SvgPicture.asset(
                      './assets/icons/delete_icon.svg'
                     )
                    ),                   
                 ],
                ),
              )
            );
  }
}