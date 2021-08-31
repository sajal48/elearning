import 'package:elearning/widgets/search_box.dart';
import 'package:elearning/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  final List<String> categoryIcon = [
    'assets/images/physics_icon.svg',
    'assets/images/social_science_icon.svg',
    'assets/images/biology_icon.svg',
    'assets/images/math_icon.svg',
  ];
  final List<String> categoryTitle = [
    'Physics',
    'Social Science',
    'Biology',
    'Math'
  ];
  final List<Color> categoryColor = [
    Color(0xffFD8593),
    Color(0xff3C3B91),
    Color(0xff797BB8),
    Color(0xff6E92F6)
  ];
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Color(0xffF4F5F9),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Positioned(
                      child: Container(
                    color: Color(0xff3D4C59),
                    child: Image.asset('assets/images/banner_home.png'),
                  )),
                  Positioned(
                      left: 33,
                      top: 25,
                      child: SvgPicture.asset(
                        'assets/images/settings_icon.svg',
                        width: 20,
                        height: 20,
                      )),
                  Positioned(
                      left: 33,
                      top: 100,
                      child: Text(
                        'Online\nEducation\nPlatform',
                        style: TextStyle(
                            fontFamily: 'Milliard',
                            color: Colors.white,
                            fontSize: 33,
                            fontWeight: FontWeight.bold),
                      )),
                  Positioned(
                      left: 118,
                      top: 80,
                      child: SvgPicture.asset('assets/images/trial_icon.svg')),
                  Positioned(
                      left: 33,
                      top: 220,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color(0xff5467FF),
                            borderRadius: BorderRadius.circular(3)),
                        height: 35,
                        width: 96,
                        child: Text(
                          'START NOW',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Milliard',
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              letterSpacing: .7),
                        ),
                      ))
                ],
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 33, vertical: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      SearchBox(),
                      SizedBox(
                        height: 50,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Hi! What would you learn today?',
                          style: TextStyle(
                            fontFamily: 'Milliard',
                            color: Color(0xff3D4C59),
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 75,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, i) {
                      return TopicCard(
                        color: widget.categoryColor[i],
                        icon: widget.categoryIcon[i],
                        title: widget.categoryTitle[i],
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
