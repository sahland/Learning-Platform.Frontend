import 'package:flutter/material.dart';

class BaseContainer extends StatelessWidget {
  const BaseContainer({
    super.key,
    required this.child,
    required this.width,
    required this.bordRadius,
    required this.horIndent,
    required this.vertIndent,
    required this.color,
    this.padding = const EdgeInsets.only(left: 0)
  });

  final Widget child;
  final double width;
  final double bordRadius;
  final double horIndent;
  final double vertIndent;
  final Color color;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin:
      EdgeInsets.symmetric(horizontal: horIndent).copyWith(bottom: vertIndent),
      padding: padding,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(bordRadius)
      ),
      child: child,
    );
  }
}