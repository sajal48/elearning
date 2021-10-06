import 'package:elearning/controllers/homepage_controller.dart';
import 'package:elearning/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({Key? key}) : super(key: key);

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
                      'All Courses',
                      style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Milliard',
                          color: Color(0xff3D4C59),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 75,
                  child: FutureBuilder(
                    future:
                        Provider.of<HomepageController>(context).getCategory(),
                    builder: (context, data) {
                      if (data.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return Consumer<HomepageController>(
                          builder: (context, orderData, child) =>
                              ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      orderData.courseCategory.result.length,
                                  itemBuilder: (context, i) {
                                    return TopicCard(
                                      quantity: 1,
                                      title: orderData.courseCategory.result[i]
                                          .categoryName,
                                    );
                                  }),
                        );
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  child: FutureBuilder(
                    future:
                        Provider.of<HomepageController>(context).getfpcourse(),
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
                                  itemCount: orderData
                                      .featuredPaidCourses.result.length,
                                  itemBuilder: (context, i) {
                                    var data =
                                        orderData.featuredPaidCourses.result[i];
                                    // print('\n');
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5.0),
                                      child: CourseWithPrice(
                                        price: data.price,
                                        // level: data.competency
                                        //     .toString()
                                        //     .substring(11)
                                        //     .toLowerCase(),
                                        // duration: data.startDate
                                        //     .toString()
                                        //     .substring(0, 10),
                                        module: data.noOfModules.toString(),
                                        banner: data.courseImage.toString(),
                                        title: data.courseName,
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
