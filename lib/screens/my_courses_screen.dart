import 'package:elearning/controllers/homepage_controller.dart';
import 'package:elearning/controllers/signup_login_controller.dart';
import 'package:elearning/widgets/relogin.dart';
import 'package:elearning/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'course_details_screen.dart';

class MyCourseScreen extends StatelessWidget {
  const MyCourseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cont_home = Provider.of<HomepageController>(context);
    final cont_home_btn =
        Provider.of<HomepageController>(context, listen: false);
    final cont_sign = Provider.of<SignUpLoginController>(context);
    final cont_sign_btn =
        Provider.of<SignUpLoginController>(context, listen: false);

    return Scaffold(
        body: SafeArea(
      child: Container(
        height: double.infinity,
        color: Color(0xffF3F5F9),
        child: cont_sign.loggedin
            ? SingleChildScrollView(
                physics: ScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 33, vertical: 25),
                      child: Center(
                        child: Text(
                          'My Courses',
                          style: TextStyle(
                              fontSize: 24,
                              fontFamily: 'Milliard',
                              color: Color(0xff3D4C59),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      child: FutureBuilder(
                        future: cont_home.getMyCourse(),
                        builder: (context, data) {
                          if (data.connectionState == ConnectionState.waiting) {
                            return Container(
                              height: MediaQuery.of(context).size.height / 1.8,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          } else {
                            return cont_home.myCourses.length == 0
                                ? Container(
                                    height: MediaQuery.of(context).size.height /
                                        1.3,
                                    child: Center(
                                      child: Text(
                                          "You haven't purchased any courses yet."),
                                    ),
                                  )
                                : ListView.builder(
                                    shrinkWrap: true,
                                    physics: BouncingScrollPhysics(
                                        parent: ClampingScrollPhysics()),
                                    scrollDirection: Axis.vertical,
                                    itemCount: cont_home.myCourses.length,
                                    itemBuilder: (context, i) {
                                      var data = cont_home.myCourses[i];
                                      // print('\n');
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        CourseDetailsScreen(
                                                          result: data,
                                                        )));
                                          },
                                          child: CourseWithPrice(
                                            isFree: !data.coursePaid!,
                                            price: data.price!,
                                            level: data.competency!,
                                            duration: data.startDate.toString(),
                                            module: data.noOfModules.toString(),
                                            banner: data.courseImage.toString(),
                                            title: data.courseName!,
                                          ),
                                        ),
                                      );
                                    });
                          }
                        },
                      ),
                    ),
                  ],
                ),
              )
            : Center(
                child: ReLogin(title: 'Please Login to continue'),
              ),
      ),
    ));
  }
}
