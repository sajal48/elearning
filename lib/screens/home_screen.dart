import 'package:elearning/widgets/search_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
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
                fit: StackFit.expand,
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
              SizedBox(
                height: 25,
              ),
              SearchBox()
            ],
          ),
        ),
      ),
    );
  }
}
