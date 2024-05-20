import 'package:flutter/material.dart';

class BaseBottomSheet extends StatelessWidget {
  const BaseBottomSheet({
    super.key,
    required this.child
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin:
      const EdgeInsets.symmetric(horizontal: 10).copyWith(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: const Color(0xFF32363F),
          borderRadius: BorderRadius.circular(118)
      ),
      child: SizedBox(
        width: double.infinity,
        child: child,
      )
    );
  }
}