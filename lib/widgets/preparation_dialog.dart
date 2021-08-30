import 'dart:ui';

import 'package:elearning/screens/board_and_class_screen.dart';
import 'package:elearning/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PreparationDialog extends StatelessWidget {
  const PreparationDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      child: Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Container(
          height: 359,
          width: 323,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                height: 339,
                width: 303,
                child: Theme(
                  data: ThemeData(unselectedWidgetColor: Color(0xff12CE8A)),
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('What are you preparing for?',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Color(0xff747A92),
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: 20,
                              ),
                              ListTile(
                                title: Text(
                                  'School & Compitative exam',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xff747A92),
                                      fontFamily: 'Roboto'),
                                ),
                                leading: Radio(
                                  activeColor: Color(0xff12CE8A),
                                  value: 1,
                                  groupValue: 1,
                                  onChanged: (a) {},
                                ),
                                horizontalTitleGap: -8,
                              ),
                              ListTile(
                                title: Text(
                                  'School Exam',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xff747A92),
                                      fontFamily: 'Roboto'),
                                ),
                                leading: Radio(
                                  activeColor: Color(0xff12CE8A),
                                  value: 0,
                                  groupValue: 1,
                                  onChanged: (a) {},
                                ),
                                horizontalTitleGap: -8,
                              ),
                              ListTile(
                                title: Text(
                                  'Compitative exam',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xff747A92),
                                      fontFamily: 'Roboto'),
                                ),
                                leading: Radio(
                                  activeColor: Color(0xff12CE8A),
                                  value: 0,
                                  groupValue: 1,
                                  onChanged: (a) {},
                                ),
                                horizontalTitleGap: -8,
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        BoardAndClassScreen()));
                          },
                          child: DefaultButton()),
                      SizedBox(
                        height: 25,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(false),
                  child: Container(
                    height: 29,
                    width: 29,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.red),
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 20,
                    ),
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
