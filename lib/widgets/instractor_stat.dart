import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InstractorStat extends StatelessWidget {
  final int avater;
  final String name;
  final String title;
  final String students;
  final int index;
  InstractorStat(
      {Key? key,
      required this.avater,
      required this.name,
      required this.title,
      required this.students,
      this.index = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: 220,
        child: Row(
          children: [
            CircleAvatar(
              radius: 73 / 2,
              backgroundImage: AssetImage('assets/images/avater_$avater.png'),
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      color: Color(0xff5467FF),
                      fontFamily: 'Milliard',
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(title,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Roboto',
                        fontSize: 14)),
                SizedBox(
                  height: 3,
                ),
                Text(
                  '$students Students',
                  style: TextStyle(color: Color(0xff747A92)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
