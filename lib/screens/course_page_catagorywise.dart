import 'package:elearning/Data/coursedata.dart';
import 'package:elearning/controllers/homepage_controller.dart';
import 'package:elearning/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens.dart';

class CoursePage_Catagorywise extends StatelessWidget {
  final String title;
  final List<Result> courselist;
  const CoursePage_Catagorywise(
      {Key? key, required this.title, required this.courselist})
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
                courselist.length == 0
                    ? Container(
                        height: MediaQuery.of(context).size.height / 1.3,
                        child: Center(
                          child: Text('No Courses available now'),
                        ),
                      )
                    : Container(
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: courselist.length,
                            itemBuilder: (context, i) {
                              var item = courselist[i];
                              // print('\n');
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CourseDetailsScreen(
                                                  result: courselist[i],
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
                            })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
