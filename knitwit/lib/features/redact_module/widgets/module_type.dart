import 'package:flutter/material.dart';

class ModuleType extends StatefulWidget {
  const ModuleType({super.key});

  @override
  State<ModuleType> createState() => _ModuleTypeState();
}

class _ModuleTypeState extends State<ModuleType> {
  Color _videoButtonColor = Color(0xFFF32363F);
  Color _imageButtonColor = Color(0xFFF32363F);

  bool _isVideoModule = true;
  bool _isImageModule = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Row(
            children: [
              ElevatedButton(
                  onPressed: _toggleVideoModule,
                  child: Text(
                    'Текст и видео',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _videoButtonColor
                  ),
                ),
                ElevatedButton(
                  onPressed: _toggleImageModule,
                  child: Text(
                    'Картинка и видео',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _imageButtonColor
                  ),
                ),
            ],
          ),
        ),
        Expanded(
          child: _isVideoModule
              ? Center(
                  child: Text(
                    'Экран для Текста и Видео',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : Center(
                  child: Text(
                    'Экран для Картинки и Видео',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
        )
      ],
    );
  }

  void _toggleImageModule() {
    setState(() {
      _isVideoModule = false;
      _isImageModule = true;
      _imageButtonColor = Color(0xFFFBE1257);
      _videoButtonColor = Color(0xFFF32363F);
    });
  }

  void _toggleVideoModule() {
    setState(() {
      _isVideoModule = true;
      _isImageModule = false;
      _videoButtonColor = Color(0xFFFBE1257);
      _imageButtonColor = Color(0xFFF32363F);
    });
  }
}