import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class ModuleBody extends StatefulWidget {
  const ModuleBody({
    super.key,
    required this.imagePath,
    required this.moduleTitle,
  });

  final String imagePath;
  final String moduleTitle;

  @override
  State<ModuleBody> createState() => _ModuleBodyState();
}

class _ModuleBodyState extends State<ModuleBody> {
  final String text = 'Embroidery, the art of decorating fabric with a needle and thread,'
      ' has captivated crafters for centuries. Its rich history and diverse techniques have given rise to a vast array of styles,'
      ' from the intricate cross-stitching of samplers to the vibrant floral designs of crewelwork.'
      ' Whether youre drawn to its meditative rhythm or the satisfaction of creating personalized masterpieces,'
      ' embroidery offers a rewarding and creative outlet for all.';

  @override
  Widget build(BuildContext context) {
    bool courseCompleted = false;

    return Column(
      children: [
        Center(
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
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 4,
          margin: const EdgeInsets.all(20),
          color: const Color(0xFF181818),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Column(
              children: [
                Image.asset(
                    widget.imagePath,
                    width: double.infinity,
                    fit: BoxFit.cover
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(
                    'Текст описания',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
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
          padding:const  EdgeInsets.symmetric(horizontal: 75),
          child: Row(
            children: [
              const Text(
                'Я прошёл этот модуль',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 20),
              CupertinoSwitch(
                  activeColor: const Color(0xFF7BA1EC),
                  thumbColor: const Color(0xFF2A4285),
                  value: courseCompleted,
                  onChanged: (value) => setState(() => courseCompleted = value),
              ),
            ],
          ),
        )
      ],
    );
  }
}