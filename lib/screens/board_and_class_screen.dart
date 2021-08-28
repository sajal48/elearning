import 'package:elearning/screens/languageselet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BoardAndClassScreen extends StatefulWidget {
  BoardAndClassScreen({Key? key}) : super(key: key);

  @override
  _BoardAndClassScreenState createState() => _BoardAndClassScreenState();
}

class _BoardAndClassScreenState extends State<BoardAndClassScreen> {
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
                Text(
                  'Select Board & Class',
                  style: TextStyle(
                      fontFamily: 'Milliard',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff3D4C59)),
                ),
                Expanded(
                    child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Which class or Grade are you in?',
                        style: TextStyle(
                            fontFamily: 'Milliard',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff747A92)),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Container(
                        height: 39,
                        width: 275,
                        padding: EdgeInsets.fromLTRB(20, 0, 5, 0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Select Board',
                              style: TextStyle(
                                  color: Color(0xff747A92), fontSize: 14),
                            ),
                            Container(
                              height: 29,
                              width: 29,
                              decoration: BoxDecoration(
                                  color: Color(0xff5467FF),
                                  borderRadius: BorderRadius.circular(5)),
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.expand_more,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      Flexible(
                        child: GridView.builder(
                            itemCount: 9,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3),
                            itemBuilder: (_, context) {
                              return Container(
                                height: 104,
                                width: 90,
                                color: Colors.amber,
                              );
                            }),
                      ),
                      GestureDetector(
                        // onTap: () {
                        //   Navigator.pushReplacement(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) =>
                        //               LanguageSelectScreen()));
                        // },
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
                                'CONTINUE',
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
