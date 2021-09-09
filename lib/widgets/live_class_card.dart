import 'package:flutter/material.dart';

class LiveClassCard extends StatelessWidget {
  const LiveClassCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      child: Container(
          child: Row(children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(9)),
          height: 95,
          width: 155,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(9),
            child: Image.asset(
              'assets/images/life_banner.png',
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                'Life Processes',
                style: TextStyle(
                    color: Color(0xff747A92),
                    fontFamily: 'Roboto',
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: 160,
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                style: TextStyle(
                  color: Color(0xff747A92),
                  fontFamily: 'Roboto',
                  fontSize: 14,
                ),
              ),
            ),
            Container(
              child: Row(
                children: [
                  Text(
                    '4:30 min',
                    style: TextStyle(color: Color(0xff5467FF)),
                  )
                ],
              ),
            ),
          ],
        )
      ])),
    );
  }
}
