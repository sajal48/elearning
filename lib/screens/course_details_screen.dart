import 'package:cached_network_image/cached_network_image.dart';
import 'package:elearning/Data/coursedata.dart';

import 'package:elearning/widgets/widgets.dart';

import 'package:flutter/material.dart';

class CourseDetailsScreen extends StatelessWidget {
  final Result result;

  const CourseDetailsScreen({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Column(//crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 33, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Color(0xff5467FF),
                  ),
                ),
                Text(
                  'Course Details',
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Milliard',
                      color: Color(0xff3D4C59),
                      fontWeight: FontWeight.bold),
                ),
                CircleAvatar(
                  radius: 14,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('assets/images/ins_avater1.png'),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 33, vertical: 20),
            child: Column(
              children: [
                Text(
                  result.courseName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Milliard',
                      color: Color(0xff3D4C59),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '4.0 (1 rating)',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Container(
            color: Colors.transparent,
            height: 110,
            child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl:
                    'https://www.rivguru.com/images/courses/course-details.jpg'),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 33, vertical: 20),
            child: Column(
              children: [
                CourseDetailsInfo(
                    title: 'Overview', description: result.description),
                CourseDetailsInfo(
                    title: 'About This Course',
                    description: result.aboutThisCourse),
                CourseDetailsInfo(
                    title: 'Who this course is for',
                    description: result.whoThisCourseIsFor),
                CourseDetailsInfo(
                  title: 'Requirements',
                  description: result.requirements,
                ),
                CourseDetailsInfo(
                  title: 'Why You Should Learn This Course',
                  description: result.whyToLearn,
                ),
                CourseDetailsInfo(
                    title: 'Skills You Will Learn',
                    description: result.whoThisCourseIsFor)
              ],
            ),
          )
        ]),
      ),
    ));
  }
}
