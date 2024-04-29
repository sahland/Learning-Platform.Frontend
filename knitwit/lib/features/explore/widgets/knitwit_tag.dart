import 'package:flutter/material.dart';

class TagButton extends StatefulWidget {
  final String tagText;

  const TagButton({Key? key, required this.tagText}) : super(key: key);

  @override
  State<TagButton> createState() => _TagButtonState();
}

class _TagButtonState extends State<TagButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final Color blackColor = Color(0xFF181818);
    final Color whiteColor = Color(0xFFFD9D9D9);

    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: _isPressed ? whiteColor : blackColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      onPressed: () {
        setState(() {
          _isPressed = !_isPressed; // Toggle pressed state
        });
      },
      child: Text(
        widget.tagText,
        style: TextStyle(
          color: _isPressed ? blackColor : whiteColor,
          fontSize: 12,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
