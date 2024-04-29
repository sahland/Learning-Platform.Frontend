import 'package:flutter/material.dart';

class TagButton extends StatefulWidget {
  final Tag tag;

  const TagButton({super.key, required this.tag});

  @override
  State<TagButton> createState() => _TagButtonState();
}

class Tag {
  final String text;
  bool isSelected;

  Tag({required this.text, this.isSelected = false});
}

class _TagButtonState extends State<TagButton> {
  @override
  Widget build(BuildContext context) {
    final Color blackColor = Color(0xFF181818);
    final Color whiteColor = Color(0xFFFD9D9D9);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.tag.isSelected ? whiteColor : blackColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      onPressed: () {
        setState(() {
          widget.tag.isSelected = !widget.tag.isSelected;
        });
      },
      child: Text(
        widget.tag.text,
        style: TextStyle(
          color: widget.tag.isSelected ? blackColor : whiteColor,
          fontSize: 12,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}