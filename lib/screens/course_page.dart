import 'package:flutter/material.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color(0xffF3F5F9),
          padding: EdgeInsets.symmetric(horizontal: 33, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.arrow_back,
                    color: Color(0xff5467FF),
                  ),
                  Text(
                    'Biology Basic',
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Milliard',
                        color: Color(0xff3D4C59),
                        fontWeight: FontWeight.bold),
                  ),
                  CircleAvatar(
                    radius: 14,
                    backgroundColor: Colors.transparent,
                    backgroundImage:
                        AssetImage('assets/images/ins_avater1.png'),
                  )
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: 135,
                child: Column(
                  children: [
                    Text(
                      'Biology & The Scientific Method',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xff657E93),
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    Text('2-4 hours a week',
                        style: TextStyle(
                          color: Color(0xff747A92),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
