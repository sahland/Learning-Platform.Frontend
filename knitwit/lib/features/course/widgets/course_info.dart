import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CourseInfo extends StatefulWidget {
  const CourseInfo({
    super.key,
    required this.tags,
    required this.courseName,
    required this.author,
  });

  final List<String> tags;
  final String courseName;
  final String author;

  @override
  State<CourseInfo> createState() => _CourseInfoState();
}

class _CourseInfoState extends State<CourseInfo> {
  late bool isFavorite = false;
  late bool _selectedEstimation = false;
  late bool _isEstimationSelected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 140,
          width: double.infinity,
          child: Image.asset(
            './assets/images/test_image.jpg',
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
          child: Text(
            widget.courseName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Column(
              children: [
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
                    )
                  ],
                ),
                const SizedBox(height: 10),
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
              ],
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                setState(() => isFavorite = !isFavorite);
              },
              icon: SvgPicture.asset('./assets/icons/star_icon.svg'),
              selectedIcon: SvgPicture.asset(
                  './assets/icons/star_icon.svg',
                  color: const Color(0xFFBE1257),
              ),
              isSelected: isFavorite,
            ),
            // Row(
            //   children: [
            //     IconButton(
            //       onPressed: () {
            //         setState(() {
            //           _selectedEstimation = true;
            //           _isEstimationSelected = true;
            //         });
            //       },
            //       icon: SvgPicture.asset('./assets/icons/thumb_up_icon.svg'),
            //       selectedIcon: SvgPicture.asset(
            //         './assets/icons/thumb_up_icon.svg.svg',
            //         color: const Color(0xFFBE1257),
            //       ),
            //       isSelected: _isEstimationSelected && _selectedEstimation,
            //     ),
            //     IconButton(
            //       onPressed: () {
            //         setState(() {
            //           _selectedEstimation = false;
            //           _isEstimationSelected = true;
            //         });
            //       },
            //       icon: SvgPicture.asset('./assets/icons/thumb_down_icon.svg.svg'),
            //       selectedIcon: SvgPicture.asset(
            //         './assets/icons/thumb_down_icon.svg',
            //         color: const Color(0xFFBE1257),
            //       ),
            //       isSelected: _isEstimationSelected && !_selectedEstimation,
            //     ),
            //   ],
            // ),
           const  SizedBox(width: 10)
          ],
        )
      ],
    );
  }
}