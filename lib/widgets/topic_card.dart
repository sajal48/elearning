import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopicCard extends StatelessWidget {
  final String image;
  final String title;
  final int quantity;
  final Color color;
  TopicCard(
      {Key? key,
      this.image = 'assets/images/life_bg.png',
      this.title = '',
      this.color = const Color(0xff3C3B91),
      this.quantity = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        height: 75,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://www.rivguru.com/images/categories/categorie1.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2), BlendMode.dstATop)),
          color: color,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //SvgPicture.asset(icon),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: .0),
            ),
            // Text(
            //   quantity.toString(),
            //   textAlign: TextAlign.center,
            //   style: TextStyle(color: Colors.white),
            // ),
          ],
        ),
      ),
    );
  }
}
