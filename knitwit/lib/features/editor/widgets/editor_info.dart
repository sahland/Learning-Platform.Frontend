import 'package:flutter/material.dart';

class EditorInfo extends StatefulWidget {
  const EditorInfo({
    super.key,
    required this.headerImage,
    required this.miniImage,
    required this.nameCourse
  });

  final String headerImage;
  final String miniImage;
  final String nameCourse;

  @override
  State<EditorInfo> createState() => _EditorInfoState();
}

class _EditorInfoState extends State<EditorInfo> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 140,
          width: double.infinity,
          child: Image.asset(
            widget.headerImage,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    widget.miniImage,
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
                        widget.nameCourse,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
        ),
        const SizedBox(height: 10),
        DecoratedBox(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.white,
                  width: 0.5
                )
              )
            ),
          child: Container(
            height: 6.0,
          ),
        )
      ],
    );
  }
}