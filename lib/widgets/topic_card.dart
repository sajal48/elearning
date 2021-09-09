import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopicCard extends StatelessWidget {
  final String icon;
  final String title;
  final Color color;
  TopicCard(
      {Key? key, required this.icon, required this.title, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        height: 75,
        width: 105,
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(6)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(icon),
            Text(
              title,
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
