import 'package:flutter/material.dart';

class ModuleTitle extends StatefulWidget {
  const ModuleTitle({
    super.key,
    required this.percentCompleted,
    required this.titleName
  });

  final double percentCompleted;
  final String titleName;

  @override
  State<ModuleTitle> createState() => _ModuleTitleState();
}

class _ModuleTitleState extends State<ModuleTitle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Center(
          child: Text(
            widget.titleName,
            style: const TextStyle(
              color: Color(0xFFA4ACC3),
              fontSize: 20,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 5),
        LinearProgressIndicator(
          minHeight: 16,
          borderRadius: BorderRadius.circular(22),
          value: widget.percentCompleted,
          color: const Color(0xFF48DFC4),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}