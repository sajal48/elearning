import 'package:elearning/Data/coursedata.dart';
import 'package:elearning/controllers/homepage_controller.dart';
import 'package:elearning/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens.dart';

class CoursePage_Catagorywise extends StatelessWidget {
  final bool paid;
  final String title;
  const CoursePage_Catagorywise(
      {Key? key, required this.paid, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color(0xffF3F5F9),
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 33, vertical: 25),
                  child: Center(
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Milliard',
                          color: Color(0xff3D4C59),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  child: FutureBuilder<CourseData>(
                    future: paid
                        ? Provider.of<HomepageController>(context)
                            .getfeaturedcourse()
                        : Provider.of<HomepageController>(context)
                            .getfreecourse(),
                    builder: (context, data) {
                      if (data.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return Consumer<HomepageController>(
                          builder: (context, orderData, child) =>
                              ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemCount: data.data!.result!.length,
                                  itemBuilder: (context, i) {
                                    var item = data.data!.result![i];
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
                                                        result: orderData
                                                            .allCourses
                                                            .result![i],
                                                      )));
                                        },
                                        child: CourseWithPrice(
                                          isFree: !item.coursePaid!,
                                          price: item.price!,
                                          level: item.competency!,
                                          duration: item.startDate.toString(),
                                          module: item.noOfModules.toString(),
                                          banner: item.courseImage.toString(),
                                          title: item.courseName!,
                                        ),
                                      ),
                                    );
                                  }),
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
