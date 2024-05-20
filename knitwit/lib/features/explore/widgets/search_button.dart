import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:knitwit/common/widgets/base_bottom_sheet.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    super.key,
    //required this.controller
  });

  //final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Color textColor = Color(0xFFFC3C3C3);
    return BaseBottomSheet(
      child: Row(
        children: [
          SizedBox(width: 10),
          Icon(
            Icons.search_rounded,
            color: textColor,
          ),
          Expanded(
              child: Container(
                child: TextField(
                  //controller: controller,
                  decoration: InputDecoration(
                    hintText: 'Поиск...',
                    hintStyle:
                      TextStyle(color: textColor),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                    enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
                    border: const OutlineInputBorder(borderSide: BorderSide.none),

                  ),
                  style: TextStyle(color: textColor),
                ),
              )
          )
        ],
      ),
    );

    // return Container(
    //     width: double.infinity,
    //     margin:
    //     const EdgeInsets.symmetric(horizontal: 10).copyWith(bottom: 10),
    //     padding: const EdgeInsets.all(10),
    //     decoration: BoxDecoration(
    //         color: const Color(0xFF32363F),
    //         borderRadius: BorderRadius.circular(118)
    //     ),
    //     child: const Row(
    //       children: [
    //         Icon(
    //           Icons.search_rounded,
    //           color: Color(0xFFECECEC),
    //         ),
    //         SizedBox(width: 10),
    //         Text('Поиск...',
    //           style: TextStyle(
    //               color: Color(0xFFA4ACC3),
    //               fontSize: 20
    //           ),
    //         ),
    //       ],
    //     )
    // );
  }
}