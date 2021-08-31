import 'package:elearning/screens/boardselect_screen.dart';
import 'package:elearning/widgets/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'board_and_class_screen.dart';

class CatagoryScreen extends StatefulWidget {
  CatagoryScreen({Key? key}) : super(key: key);

  @override
  _CatagoryScreenState createState() => _CatagoryScreenState();
}

class _CatagoryScreenState extends State<CatagoryScreen> {
  final List<String> languages = [
    "English",
    "Chiness",
    "Hindi",
    "Portuguese",
    "Spanish",
    "Arabic",
    "Russian"
  ];
  List<int> exampleList = [0, 1, 2, 3, 4, 5, 6];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(34, 0, 34, 50),
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Choose your\nCatagory',
                style: TextStyle(
                    fontFamily: 'Milliard',
                    fontSize: 54,
                    color: Color(0xff3D4C59),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BoardAndClassScreen()));
                    },
                    child: Category(
                      index: 0,
                      isSelected: true,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => (BoardSelectScreen())));
                    },
                    child: Category(
                      index: 1,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Category(
                    index: 2,
                  ),
                  Category(
                    index: 3,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
