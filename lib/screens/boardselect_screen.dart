import 'package:elearning/widgets/board_selector.dart';
import 'package:elearning/widgets/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BoardSelectScreen extends StatefulWidget {
  const BoardSelectScreen({Key? key}) : super(key: key);

  @override
  _BoardSelectScreenState createState() => _BoardSelectScreenState();
}

class _BoardSelectScreenState extends State<BoardSelectScreen> {
  List<String> boards = [
    "CBSC",
    "CISCE",
    "CU",
    "IB",
    "IGCSE",
    "SSC",
    "State Board",
    "NIOS"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffF4F5F9),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Customize your Syllabus',
              style: TextStyle(
                  fontFamily: 'Milliard',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff3D4C59)),
            ),
            SizedBox(
              height: 70.0,
            ),
            Expanded(
                child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Which is your school board?',
                    style: TextStyle(
                        fontFamily: 'Milliard',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff747A92)),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Flexible(
                      child: GridView.builder(
                          itemCount: 8,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: (158 / 74)),
                          itemBuilder: (_, index) {
                            return BoardSelector(
                              index: index,
                              boardname: boards[index],
                              isSelected: (index == 4),
                            );
                          })),
                  GestureDetector(
                      onTap: () {
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) {
                              return PreparationDialog();
                            });
                      },
                      child: DefaultButton()),
                ],
              ),
            )),
            SizedBox(
              height: 50,
            )
          ],
        ),
      )),
    );
  }
}
