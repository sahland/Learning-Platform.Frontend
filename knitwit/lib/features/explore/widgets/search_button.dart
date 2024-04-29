import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin:
        const EdgeInsets.symmetric(horizontal: 10).copyWith(bottom: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: const Color(0xFF32363F),
            borderRadius: BorderRadius.circular(118)
        ),
        child: const Row(
          children: [
            Icon(
              Icons.search_rounded,
              color: Color(0xFFECECEC),
            ),
            SizedBox(width: 10),
            Text('Поиск...',
              style: TextStyle(
                  color: Color(0xFFA4ACC3),
                  fontSize: 20
              ),
            ),
          ],
        )
    );
  }
}