import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class CourseStat extends StatelessWidget {
  final int avater;
  final String name;
  final String title;
  final String time;
  final int index;
  final String duration;
  CourseStat(
      {Key? key,
      required this.avater,
      required this.name,
      required this.title,
      required this.time,
      required this.duration,
      this.index = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 33.0),
      child: Container(
        child: Row(
          children: [
            CircleAvatar(
              radius: 73 / 2,
              backgroundImage: AssetImage('assets/images/tc_avater$avater.png'),
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .5,
                  child: Text(
                    name,
                    style: TextStyle(
                        color: Color(0xff657E93),
                        fontFamily: 'Roboto',
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(title,
                    style: TextStyle(
                        color: Color(0xff5467FF),
                        fontFamily: 'Roboto',
                        fontSize: 14)),
                SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                    Text(
                      '$time Days ago',
                      style: TextStyle(fontSize: 12, color: Color(0xff747A92)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset('assets/images/duration_icon.svg'),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          duration,
                          style:
                              TextStyle(fontSize: 12, color: Color(0xff747A92)),
                        )
                      ],
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
