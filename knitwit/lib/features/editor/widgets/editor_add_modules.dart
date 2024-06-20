import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:knitwit/features/editor/widgets/editor_module.dart';

class EditorAddModule extends StatefulWidget {
  const EditorAddModule({super.key});

  @override
  _EditorAddModuleState createState() => _EditorAddModuleState();
}

class _EditorAddModuleState extends State<EditorAddModule> {
  final List<int> _modules = [];

  void _addModule() {
    setState(() {
      _modules.add(_modules.length);
    });
  }

  void _deleteModule(int index) {
    setState(() {
      _modules.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                'Модули',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500
                ),
              ),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF404040),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(73),
                  ),
                ),
                onPressed: _addModule,
                child: Row(
                  children: [
                    const Text(
                      'Создать',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    const SizedBox(width: 10),
                    SvgPicture.asset('./assets/icons/plus_icon.svg'),
                  ],
                ),
              ),
            ],
          ),
          ..._modules.asMap().entries.map((entry) {
            final index = entry.key;
            return CourseModule(
              key: ValueKey(index),
              onDelete: () => _deleteModule(index),
            );
          }).toList(),
        ],
      ),
    );
  }
}