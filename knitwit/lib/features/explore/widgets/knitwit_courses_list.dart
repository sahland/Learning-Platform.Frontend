import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:knitwit/router/router.dart';

class KnitwitCoursesList extends StatefulWidget {
  final String nameCourse;
  final String imagePath;
  final String description;
  final List<String> tags;

  const KnitwitCoursesList({
    super.key,
    required this.nameCourse,
    required this.imagePath,
    required this.description,
    required this.tags
  });

  @override
  State<KnitwitCoursesList> createState() => _KnitwitCoursesListState();
}

class _KnitwitCoursesListState extends State<KnitwitCoursesList> {
  bool _isExpanded = false;

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
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
                          alignment: WrapAlignment.spaceBetween,
                          children: [
                            for (final tag in widget.tags)
                              Container(
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
                              ),
                          ],
                        ),
                      ],
                    ),
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
                    widget.description,
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
      ),
    );
  }
}
