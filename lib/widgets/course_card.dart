import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CourseCard extends StatelessWidget {
  final String banner;
  final String title;
  final String subtitle;
  final String hours;
  final Color color;
  const CourseCard(
      {Key? key,
      required this.banner,
      required this.title,
      required this.subtitle,
      required this.hours,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        height: 260,
        width: 197,
        child: Column(
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(8)),
              height: 120,
              width: 197,
              child: SvgPicture.asset(
                banner,
                fit: BoxFit.scaleDown,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(title,
                          style: TextStyle(
                              color: Color(0xff5467FF),
                              fontFamily: 'Milliard',
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      SvgPicture.asset(
                        'assets/images/bookmark_icon.svg',
                        height: 15,
                        width: 9.8,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontFamily: 'Milliard',
                          color: Color(0xff3D4C59),
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '$hours hours a week',
                        style: TextStyle(color: Color(0xff747A92)),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
