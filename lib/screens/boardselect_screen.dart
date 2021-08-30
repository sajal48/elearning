import 'package:elearning/widgets/boardselector.dart';
import 'package:elearning/widgets/preparation_dialog.dart';
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
                          context: context,
                          builder: (context) {
                            return PreparationDialog();
                          });
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
            SizedBox(
              height: 50,
            )
          ],
        ),
      )),
    );
  }
}
