import 'package:flutter/material.dart';

class CourseDetailsInfo extends StatelessWidget {
  final String title;
  final String description;
  const CourseDetailsInfo(
      {Key? key, required this.title, this.description = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Milliard',
                  color: Color(0xff3D4C59),
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            description,
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
