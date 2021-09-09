import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CourseWithPrice extends StatelessWidget {
  final String banner;
  final String title;
  final String view;
  final String duration;
  final String instractor;
  final String avater;
  final String price;
  final String offerPrice;
  final Color color;
  const CourseWithPrice({
    Key? key,
    required this.banner,
    required this.title,
    required this.view,
    required this.duration,
    required this.instractor,
    required this.avater,
    required this.price,
    required this.offerPrice,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        height: 320,
        width: 230,
        child: Column(
          children: [
            Container(
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(8)),
                height: 130,
                width: 230,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    banner,
                    width: 230,
                    height: 130,
                    fit: BoxFit.fill,
                  ),
                )),
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
                              color: Color(0xff35414E),
                              fontFamily: 'Milliard',
                              fontSize: 22,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('assets/images/view_icon.svg'),
                          Text(
                            '$view views',
                            style: TextStyle(
                                fontSize: 12, color: Color(0xff747A92)),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset('assets/images/duration_icon.svg'),
                          Text(
                            duration,
                            style: TextStyle(
                                fontSize: 12, color: Color(0xff747A92)),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(avater),
                        radius: 18,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        instractor,
                        style: TextStyle(
                            color: Color(0xff5467FF),
                            fontFamily: 'Milliard',
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text(
                        '$price \$',
                        style: TextStyle(
                            color: Color(0xff747A92),
                            fontFamily: 'Roboto',
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        '$offerPrice \$',
                        style: TextStyle(
                            color: Color(0xff747A92),
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            decoration: TextDecoration.lineThrough),
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
