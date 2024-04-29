import 'package:flutter/cupertino.dart';

class KnitwitTitle extends StatelessWidget {
  final String title;

  const KnitwitTitle({
    super.key,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Color(0xFFA3ABC3),
          fontSize: 20,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          height: 0,
        ),
      ),
    );
  }
}