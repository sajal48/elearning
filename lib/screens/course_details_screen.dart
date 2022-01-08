import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:elearning/Data/coursedata.dart';
import 'package:elearning/controllers/homepage_controller.dart';
import 'package:elearning/screens/paymentmethod_screen.dart';

import 'package:elearning/widgets/widgets.dart';

import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:provider/provider.dart';

class CourseDetailsScreen extends StatelessWidget {
  final Result result;

  const CourseDetailsScreen({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cont_home = Provider.of<HomepageController>(context);
    final cont_home_btn =
        Provider.of<HomepageController>(context, listen: false);

    bool isPurchased = cont_home.CoursePaid(result.id!);
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
                  result.courseName ?? "No data",
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
                // Text(
                //   '4.0 (1 rating)',
                //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                // )
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
                    title: 'Overview',
                    description: result.description ?? 'No data'),
                CourseDetailsInfo(
                    title: 'About This Course',
                    description: result.aboutThisCourse ?? 'No data'),
                CourseDetailsInfo(
                    title: 'Who this course is for',
                    description: result.whoThisCourseIsFor ?? 'No data'),
                CourseDetailsInfo(
                  title: 'Requirements',
                  description:
                      result.requirements ?? "Anyone can join this course.",
                ),
                CourseDetailsInfo(
                  title: 'Why You Should Learn This Course',
                  description: result.whyToLearn ?? 'No data',
                ),
                CourseDetailsInfo(
                    title: 'Skills You Will Learn',
                    description: result.whoThisCourseIsFor ?? 'No data'),
                SizedBox(
                  height: 20,
                ),
                CourseDetailsInfo(title: "Modules"),
                result.noOfModules != null
                    ? Container(
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: result.noOfModules,
                            itemBuilder: (context, index) {
                              ModuleClass? module =
                                  ModuleClass.fromJson(result.modules![index]);

                              return ModuleSection(
                                  moduleData: module, isPurchased: isPurchased);
                            }),
                      )
                    : Text('No Modules'),
                SizedBox(
                  height: 20,
                ),
                isPurchased
                    ? SizedBox.shrink()
                    : Container(
                        height: 60,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10)),
                        child: TextButton(
                          child: Text(
                            "Enroll Now",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Milliard',
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () async {
                            if (result.coursePaid!) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PaymentMethodScreen(
                                            course_id: result.id!,
                                            course_name: result.courseName!,
                                            course_price: result.price!,
                                          )));
                            } else {
                              CustomProgressDialog? progressDialog =
                                  CustomProgressDialog(context,
                                      blur: 10,
                                      dismissable:
                                          false); //You can set Loading Widget using this function
                              progressDialog.setLoadingWidget(
                                  CircularProgressIndicator(
                                      valueColor:
                                          AlwaysStoppedAnimation(Colors.blue)));
                              progressDialog.show();
                              String message =
                                  await cont_home_btn.enrollFree(result.id!);
                              progressDialog.dismiss();
                              NAlertDialog(
                                title: Text("Notice: "),
                                content: Text(message),
                                blur: 2,
                              ).show(context,
                                  transitionType: DialogTransitionType.Bubble);
                              await Future.delayed(Duration(milliseconds: 500));
                              if (message ==
                                  "You have enrolled successfully.") {
                                Navigator.popAndPushNamed(
                                    context, '/myCoursePage');
                              }
                            }
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
