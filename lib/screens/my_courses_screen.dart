import 'package:elearning/controllers/homepage_controller.dart';
import 'package:elearning/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'course_details_screen.dart';

class MyCourseScreen extends StatelessWidget {
  const MyCourseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          color: Color(0xffF3F5F9),
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 33, vertical: 25),
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
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: FutureBuilder(
                    future:
                        Provider.of<HomepageController>(context).getMyCourse(),
                    builder: (context, data) {
                      if (data.connectionState == ConnectionState.waiting) {
                        return Container(
                          height: MediaQuery.of(context).size.height / 1.8,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else {
                        return Consumer<HomepageController>(
                          builder: (context, orderData, child) =>
                              RefreshIndicator(
                            onRefresh: () async {},
                            child: orderData.myCourses.length == 0
                                ? Container(
                                    height: MediaQuery.of(context).size.height /
                                        1.8,
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
                                    itemCount: orderData.myCourses.length,
                                    itemBuilder: (context, i) {
                                      var data = orderData.myCourses[i];
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
                                            price: data.price!,
                                            level: data.competency!,
                                            duration: data.startDate.toString(),
                                            module: data.noOfModules.toString(),
                                            banner: data.courseImage.toString(),
                                            title: data.courseName!,
                                          ),
                                        ),
                                      );
                                    }),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
