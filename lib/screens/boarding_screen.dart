import 'package:dots_indicator/dots_indicator.dart';
import 'package:elearning/controllers/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
        height: double.infinity,
        width: double.infinity,
        color: Provider.of<OnboardingController>(context).color,
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      !last
                          ? Text(
                              'skip',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 16,
                                  color: Colors.white),
                            )
                          : Text(''),
                    ],
                  ),
                ),
              ),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Align(
                    child: SvgPicture.asset(
                      Provider.of<OnboardingController>(context).img,
                    ),
                  ),
                  Align(
                    child: Container(
                      //padding: EdgeInsets.only(bottom: 50),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'I am a',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 16,
                                color:
                                    Provider.of<OnboardingController>(context)
                                        .txtclr),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            'Learner',
                            style: TextStyle(
                                fontFamily: 'Milliard',
                                fontSize: 22,
                                color: Colors.white,
                                letterSpacing: 1.2,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'b nkjdjk basdjkn wdblhjv dasldh sdkjb ',
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    color: Provider.of<OnboardingController>(context).txtclr),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                'kbk nb skjbs ',
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    color: Provider.of<OnboardingController>(context).txtclr),
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
                  Provider.of<OnboardingController>(context, listen: false)
                      .nxt();
                },
                child: Container(
                  width: 233,
                  height: 47,
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                      color: Provider.of<OnboardingController>(context).btnclr,
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
              Padding(
                padding: EdgeInsets.symmetric(vertical: 25),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome back! ',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16,
                            color: Colors.white),
                      ),
                      Text(
                        'Log in.',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Provider.of<OnboardingController>(context)
                                .txtclr),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
