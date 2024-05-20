import 'package:flutter/material.dart';

class LowBox extends StatefulWidget {
  const LowBox({super.key});

  @override
  State<LowBox> createState() => _LowBoxState();
}

class _LowBoxState extends State<LowBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 10),
          Flexible(
            flex: 1,
            child: SizedBox(
              height: 120,
              child: Card(
                elevation: 4,
                color: Color(0xFF181818),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Всего\nподписок',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF7D8495),
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Spacer(),
                      Text(
                        '99999',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 20),
          Flexible(
            flex: 2,
            child: SizedBox(
              height: 120,
              child: Card(
                elevation: 4,
                color: Color(0xFF181818),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Закончено последним',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF7D8495),
                            fontSize: 14,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Wrap(
                        children: [
                          Text(
                            'Figma ipsum component variant main layer. Follower clip asset layer outline asset.',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
