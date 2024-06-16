import 'package:flutter/material.dart';

class BaseLongButton extends StatefulWidget {
  final dynamic onPressed;
  final String title;
  final Color textColor;

  const BaseLongButton({
    super.key,
    required this.onPressed,
    required this.title,
    required this.textColor,
  });

  @override
  State<BaseLongButton> createState() => _BaseLongButtonState();

}

class _BaseLongButtonState extends State<BaseLongButton> {

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
      onPressed: widget.onPressed,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.zero,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.title,
            style: TextStyle(
              color: widget.textColor,
              fontSize: 16,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}