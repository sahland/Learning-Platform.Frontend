import 'package:flutter/material.dart';

class TagButton extends StatefulWidget {
  final KnitwitTag tag;

  const TagButton({super.key, required this.tag});

  @override
  State<TagButton> createState() => _TagButtonState();
}

class KnitwitTag {
  final String text;
  bool isSelected;

  KnitwitTag({required this.text, this.isSelected = false});
}

class _TagButtonState extends State<TagButton> {
  @override
  Widget build(BuildContext context) {
    final Color blackColor = Color(0xFF181818);
    final Color whiteColor = Color(0xFFFD9D9D9);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        backgroundColor: widget.tag.isSelected ? whiteColor : blackColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
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
