import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../bloc/bloc.dart';

class CourseInfo extends StatefulWidget {
  const CourseInfo({
    super.key,
    required this.tags,
    required this.courseName,
    required this.author,
    required this.percentCompleted,
    required this.courseId,
  });

  final List<String> tags;
  final String courseName;
  final String author;
  final double percentCompleted;
  final int courseId;

  @override
  State<CourseInfo> createState() => _CourseInfoState();
}

class _CourseInfoState extends State<CourseInfo> {
  late bool _isSubscribed = false;

  @override
  void initState() {
    BlocProvider.of<CourseBloc>(context).add(SubscribeCourseEvent(courseId: widget.courseId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LinearProgressIndicator(
          minHeight: 10,
          value: widget.percentCompleted,
          color: const Color(0xFF48DFC4),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Text(
            widget.courseName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            const SizedBox(width: 20),
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
            const SizedBox(width: 10),
            Column(
              children: [
                Text(
                  'Автор:  ${widget.author}',
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    color: Color(0xFFACACAC),
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(microseconds: 200),
                  child: ElevatedButton(
                    onPressed: () {
                      if (!_isSubscribed) {
                        BlocProvider.of<CourseBloc>(context).add(
                          SubscribeCourseEvent(courseId: widget.courseId),
                        );
                      }
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          './assets/icons/star_icon.svg',
                          color: _isSubscribed ? Color(0xFFFBE1257) : Colors.white,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          _isSubscribed ? 'Подписано' : 'Подписаться',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF404040),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
