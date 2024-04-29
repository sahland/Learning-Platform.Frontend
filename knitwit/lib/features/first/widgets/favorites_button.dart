import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:knitwit/router/router.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}



class _FavoriteButtonState extends State<FavoriteButton> {

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        context.router.push(const FavoriteCoursesRoute());
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Stack(
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  './assets/buttons/favorite_courses_button.jpg',
                  width: 370,
                  height: 116,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Row(
              children: [
                SizedBox(width: 30),
                Column(
                  children: [
                    SizedBox(height: 33,),
                    Text(
                      'Отслеживаемые',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      'Курсы',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
    // return Card(
    //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    //   elevation: 4,
    //   margin: const EdgeInsets.all(20),
    //   child: ClipRRect(
    //     borderRadius: BorderRadius.circular(8),
    //     child: GestureDetector(
    //       onTap: _navigateToFavoriteListScreen,
    //       child: Stack(
    //         children: [
    //           Container(
    //             decoration: BoxDecoration(
    //               image: DecorationImage(
    //                 image: AssetImage('./assets/buttons/favorite_courses_button.jpg'),
    //                 fit: BoxFit.cover,
    //               ),
    //             ),
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.all(20),
    //             child: Text(
    //               'Отслеживаемые\nКурсы',
    //               style: TextStyle(
    //                 color: Colors.white,
    //                 fontSize: 25,
    //                 fontFamily: 'Inter',
    //                 fontWeight: FontWeight.w700,
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}