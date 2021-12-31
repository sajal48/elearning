import 'package:cached_network_image/cached_network_image.dart';
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
  final String level;
  final String module;
  final bool isFree;
  const CourseWithPrice({
    Key? key,
    required this.banner,
    required this.isFree,
    required this.title,
    this.view = '',
    this.duration = '',
    this.instractor = '',
    this.avater = '',
    required this.price,
    this.offerPrice = '',
    this.color = Colors.transparent,
    this.level = '',
    this.module = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        height: 180,
        width: 350,
        child: Row(
          children: [
            Container(
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8)),
                height: 180,
                width: 120,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      width: 120,
                      height: 180,
                      imageUrl: banner,
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ))),

            //   Image.network(
            //     banner,
            //     width: 120,
            //     height: 180,
            //     fit: BoxFit.fill,
            //   ),
            // )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 200,
                        child: Text(title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: TextStyle(
                                color: Color(0xff35414E),
                                fontFamily: 'Milliard',
                                fontSize: 22,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  // SizedBox(
                  //   height: 8,
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Row(
                  //       children: [
                  //         SvgPicture.asset('assets/images/view_icon.svg'),
                  //         Text(
                  //           '$view views',
                  //           style: TextStyle(
                  //               fontSize: 12, color: Color(0xff747A92)),
                  //         )
                  //       ],
                  //     ),
                  //     Row(
                  //       children: [
                  //         SvgPicture.asset('assets/images/duration_icon.svg'),
                  //         Text(
                  //           duration,
                  //           style: TextStyle(
                  //               fontSize: 12, color: Color(0xff747A92)),
                  //         )
                  //       ],
                  //     )
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     CircleAvatar(
                  //       backgroundImage: AssetImage(avater),
                  //       radius: 18,
                  //     ),
                  //     SizedBox(
                  //       width: 5,
                  //     ),
                  //     Text(
                  //       instractor,
                  //       style: TextStyle(
                  //           color: Color(0xff5467FF),
                  //           fontFamily: 'Milliard',
                  //           fontSize: 16,
                  //           fontWeight: FontWeight.bold),
                  //     )
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 15,
                  // ),
                  Row(
                    children: [
                      isFree
                          ? Text(
                              'Free',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontFamily: 'Roboto',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )
                          : Text(
                              'IDR $price',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontFamily: 'Roboto',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),

                      // SizedBox(
                      //   width: 20,
                      // ),
                      // Text(
                      //   '$offerPrice \$',
                      //   style: TextStyle(
                      //       color: Color(0xff747A92),
                      //       fontFamily: 'Roboto',
                      //       fontSize: 14,
                      //       decoration: TextDecoration.lineThrough),
                      // )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.new_releases_outlined,
                        size: 14,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '$level',
                        style: TextStyle(
                          color: Color(0xff747A92),
                          fontFamily: 'Roboto',
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.checklist_outlined,
                        size: 14,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '$module modules',
                        style: TextStyle(
                          color: Color(0xff747A92),
                          fontFamily: 'Roboto',
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time_outlined,
                        size: 14,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        duration,
                        style: TextStyle(
                          color: Color(0xff747A92),
                          fontFamily: 'Roboto',
                          fontSize: 14,
                        ),
                      ),
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
