import 'package:dots_indicator/dots_indicator.dart';
import 'package:elearning/controllers/onboarding_controller.dart';
import 'package:elearning/screens/login_screen.dart';
import 'package:elearning/screens/nav_screen.dart';
import 'package:elearning/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

class BoardingPage extends StatefulWidget {
  const BoardingPage({Key? key}) : super(key: key);

  @override
  _BoardingPageState createState() => _BoardingPageState();
}

class _BoardingPageState extends State<BoardingPage> {
  @override
  Widget build(BuildContext context) {
    bool last = Provider.of<OnboardingController>(context).islast();
    return Scaffold(
      body: AnimatedContainer(
        padding: EdgeInsets.all(10),
        duration: Duration(milliseconds: 500),
        curve: Curves.linearToEaseOut,
        height: double.infinity,
        width: double.infinity,
        color: Provider.of<OnboardingController>(context).color,
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      !last
                          ? GestureDetector(
                              onTap: () {
                                final box = GetStorage();
                                box.write("boarding", false);
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => NavScreen()));
                              },
                              child: Text(
                                'Skip',
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                            )
                          : Text(''),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 100.0,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 30, 15, 20),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: SvgPicture.asset(
                      Provider.of<OnboardingController>(context).img,
                      width: 500,
                      allowDrawingOutsideViewBox: true,
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    Provider.of<OnboardingController>(context).title,
                    textAlign: TextAlign.center,
                    style: !last
                        ? TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16,
                            color: Provider.of<OnboardingController>(context)
                                .txtclr)
                        : TextStyle(
                            fontFamily: 'Milliard',
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    Provider.of<OnboardingController>(context).name,
                    style: TextStyle(
                        fontFamily: 'Milliard',
                        fontSize: 22,
                        color: Colors.white,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 30),
                  Provider.of<OnboardingController>(context).index == 2
                      ? SvgPicture.asset('assets/images/Vector.svg')
                      : SizedBox(
                          height: 30.0,
                        ),
                  Text(
                    (Provider.of<OnboardingController>(context).index < 2)
                        ? ''
                        : '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        color:
                            Provider.of<OnboardingController>(context).txtclr),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  !last
                      ? DotsIndicator(
                          dotsCount: 3,
                          position: Provider.of<OnboardingController>(context)
                              .index
                              .toDouble(),
                          decorator: DotsDecorator(
                            color: Colors.white,
                            activeColor: Colors.white,
                            size: const Size.square(5.0),
                            activeSize: const Size(15.0, 5.0),
                            activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                          ),
                        )
                      : SizedBox.shrink(),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.deferToChild,
                    onTap: () {
                      if (Provider.of<OnboardingController>(context,
                                  listen: false)
                              .index ==
                          3) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => NavScreen()),
                        );
                        // Navigator.pop(context);
                      }
                      Provider.of<OnboardingController>(context, listen: false)
                          .nxt();
                    },
                    child: Container(
                      width: 233,
                      height: 47,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                          color:
                              Provider.of<OnboardingController>(context).btnclr,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 35,
                          ),
                          Text(
                            'NEXT',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                                fontSize: 16),
                          ),
                          CircleAvatar(
                              radius: 17,
                              backgroundColor:
                                  Provider.of<OnboardingController>(context)
                                      .btnsltclr,
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 20,
                              ))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 100.0),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 25),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: !last
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Welcome back! ',
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 16,
                                      color: Colors.white),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    final box = GetStorage();
                                    box.write("boarding", false);
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreen()));
                                  },
                                  child: Text(
                                    'Log in.',
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color:
                                            Provider.of<OnboardingController>(
                                                    context)
                                                .txtclr),
                                  ),
                                )
                              ],
                            )
                          : SizedBox(
                              height: 17,
                            ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
