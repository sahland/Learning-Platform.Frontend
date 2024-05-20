import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../router/router.dart';

class EditorAddModule extends StatelessWidget {
  const EditorAddModule({
    super.key,
  });

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
                  fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF404040),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(73),
                ),
              ),
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  children: [
                    Text(
                      'Создать',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500
                      ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          elevation: 0,
          color: const Color(0xFF000000).withOpacity(0.25),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            child: Row(
              children: [
                const Text(
                  'Название модуля',
                   textAlign: TextAlign.start,
                   style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500
                     ),
                   ),
                   const Spacer(),
                   IconButton(
                    onPressed: () {
                      context.router.push(const ModuleRoute());
                    },
                     icon: SvgPicture.asset(
                      './assets/icons/edit_icon.svg'
                     )
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                    onPressed: () {},
                     icon: SvgPicture.asset(
                      './assets/icons/delete_icon.svg'
                     )
                    ),                   
                 ],
                ),
              )
            ),
        ]
      )
    );
  }
}
