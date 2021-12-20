import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:elearning/Data/coursedata.dart';
import 'package:elearning/controllers/homepage_controller.dart';
import 'package:elearning/screens/paymentmethod_screen.dart';

import 'package:elearning/widgets/widgets.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CourseDetailsScreen extends StatelessWidget {
  final Result result;

  const CourseDetailsScreen({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isPurchased =
        Provider.of<HomepageController>(context).CoursePaid(result.id!);
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
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 33, vertical: 20),
            child: Column(
              children: [
                Text(
                  result.courseName!,
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
                    title: 'Overview', description: result.description!),
                CourseDetailsInfo(
                    title: 'About This Course',
                    description: result.aboutThisCourse!),
                CourseDetailsInfo(
                    title: 'Who this course is for',
                    description: result.whoThisCourseIsFor!),
                CourseDetailsInfo(
                  title: 'Requirements',
                  description:
                      result.requirements ?? "Anyone can join this course.",
                ),
                CourseDetailsInfo(
                  title: 'Why You Should Learn This Course',
                  description: result.whyToLearn!,
                ),
                CourseDetailsInfo(
                    title: 'Skills You Will Learn',
                    description: result.whoThisCourseIsFor!),
                SizedBox(
                  height: 20,
                ),
                CourseDetailsInfo(title: "Modules"),
                Container(
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: result.noOfModules,
                      itemBuilder: (context, index) {
                        ModuleClass? module =
                            ModuleClass.fromJson(result.modules![index]);

                        return ModuleSection(
                            moduleTitle: module.moduleName!,
                            isPurchased: isPurchased);
                      }),
                ),
                SizedBox(
                  height: 20,
                ),
                isPurchased
                    ? SizedBox.shrink()
                    : Container(
                        height: 60,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.red[100],
                            borderRadius: BorderRadius.circular(10)),
                        child: TextButton(
                          child: Text(
                            "Buy this course",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Milliard',
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PaymentMethodScreen(
                                          course_id: result.id!,
                                          course_name: result.courseName!,
                                          course_price: result.price!,
                                        )));
                          },
                        ),
                      )
              ],
            ),
          ),
        ]),
      ),
    ));
  }
}
