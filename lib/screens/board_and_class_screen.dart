import 'package:elearning/screens/boardselect_screen.dart';
import 'package:elearning/widgets/board_and_class_grid.dart';
import 'package:elearning/widgets/preparation_dialog.dart';
import 'package:flutter/material.dart';

class BoardAndClassScreen extends StatefulWidget {
  BoardAndClassScreen({Key? key}) : super(key: key);

  @override
  _BoardAndClassScreenState createState() => _BoardAndClassScreenState();
}

class _BoardAndClassScreenState extends State<BoardAndClassScreen> {
  List<String> number = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xffF4F5F9),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 60, vertical: 30),
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
                SizedBox(
                  height: 50,
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
                            fontWeight: FontWeight.w800,
                            color: Color(0xff747A92)),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        height: 39,
                        padding: EdgeInsets.fromLTRB(20, 0, 5, 0),
                        margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
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
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            BoardSelectScreen()));
                              },
                              child: Container(
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
                            physics: BouncingScrollPhysics(),
                            itemCount: 12,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: (90 / 104),
                                    crossAxisCount: 3),
                            itemBuilder: (_, index) {
                              return BoardAndClassGrid(
                                index: index,
                              );
                            }),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      GestureDetector(
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
                      SizedBox(height: 50)
                    ],
                  ),
                )),
              ],
            ),
          ),
        ));
  }
}
