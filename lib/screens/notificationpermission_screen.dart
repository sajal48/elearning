import 'package:elearning/screens/languageselet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationPermissionScreen extends StatefulWidget {
  NotificationPermissionScreen({Key? key}) : super(key: key);

  @override
  _NotificationPermissionScreenState createState() =>
      _NotificationPermissionScreenState();
}

class _NotificationPermissionScreenState
    extends State<NotificationPermissionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xffF4F5F9),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Skip',
                      style: TextStyle(color: Color(0xffF4F5F9)),
                    ),
                    Text(
                      'Notifications',
                      style: TextStyle(
                          fontFamily: 'Milliard',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff3D4C59)),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LanguageSelectScreen()));
                      },
                      child: Text('Skip',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff657E93))),
                    )
                  ],
                ),
                Expanded(
                    child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/notification.svg'),
                      SizedBox(
                        height: 25.0,
                      ),
                      Text(
                        "Stey notified about new courses,\nupdates, scoreboard and stats",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xff758FA4),
                            fontSize: 16.0,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      LanguageSelectScreen()));
                        },
                        child: Container(
                          height: 47,
                          width: 233,
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                              color: Color(0xff5790FF),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 35,
                              ),
                              Text(
                                'ALLOW',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 1.5,
                                    fontSize: 16),
                              ),
                              CircleAvatar(
                                  radius: 17,
                                  backgroundColor: Color(0xff3C55F0),
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                    size: 20,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
        ));
  }
}
