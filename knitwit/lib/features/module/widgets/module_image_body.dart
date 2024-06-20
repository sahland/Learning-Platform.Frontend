import 'package:flutter/material.dart';

class ModuleImageBody extends StatefulWidget {
  const ModuleImageBody({
    super.key,
    required this.imagePath,
    required this.moduleTitle,
    required this.content,

  });
  final String imagePath;
  final String moduleTitle;
  final String content;

  @override
  State<ModuleImageBody> createState() => _ModuleImageBodyState();
}

class _ModuleImageBodyState extends State<ModuleImageBody> {

  @override
  Widget build(BuildContext context) {
    bool courseCompleted = false;

    return Column(
      children: [
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 4,
            margin: const EdgeInsets.all(20),
            color: const Color(0xFF181818),
            child: Center(
            child: Text(
              widget.moduleTitle,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 4,
          margin: const EdgeInsets.all(20),
          color: const Color(0xFF181818),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Column(
              children: [
                Image.network(
                    widget.imagePath,
                    width: double.infinity,
                    fit: BoxFit.cover
                ),
              ],
            ),
          ),
        ),
        Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 4,
            margin: const EdgeInsets.all(20),
            color: const Color(0xFF181818),
            child: Center(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                widget.content,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 20),
        DecoratedBox(
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                    color: Colors.white,
                    width: 0.5,
                  )
              )
          ),
          child: Container(
            height: 6.0,
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding:const  EdgeInsets.symmetric(horizontal: 118),
          child: Row(
            children: [
              const SizedBox(width: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFBE1257),
                    shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        )
                  ),
                  child: const Text(
                    'Завершить',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                )
              )              
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}