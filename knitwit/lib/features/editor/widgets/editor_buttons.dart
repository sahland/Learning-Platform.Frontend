import 'package:flutter/material.dart';

class EditorButtons extends StatelessWidget {
  const EditorButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              elevation: 0,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0)
              )
            ),

            child: Container(
              width: double.infinity,
              padding: EdgeInsets.zero,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Иконка курса',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Размер картинки 128x128',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF787878),
                      fontSize: 12,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            )
        ),
        ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0)
                )
            ),

            child: Container(
              width: double.infinity,
              padding: EdgeInsets.zero,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Баннер курса',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Размер картинки 200x800',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF787878),
                      fontSize: 12,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            )
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            elevation: 0,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
          ),
          onPressed: () {},
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.zero,
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Название',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            elevation: 0,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
          ),
          onPressed: () {},
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.zero,
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Теги',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        DecoratedBox(
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: Colors.white,
                      width: 0.5
                  )
              )
          ),
          child: Container(
            height: 6.0,
          ),
        )
      ],
    );
  }
}