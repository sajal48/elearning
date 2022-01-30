import 'package:elearning/Data/coursecategory.dart';
import 'package:elearning/Data/coursedata.dart';
import 'package:elearning/controllers/homepage_controller.dart';

import 'package:elearning/widgets/snack.dart';
import 'package:elearning/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'course_details_screen.dart';

class CoursePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cont_home = Provider.of<HomepageController>(context);
    final cont_home_btn =
        Provider.of<HomepageController>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color(0xffF3F5F9),
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              children: [
                PageTitle('All courses'),
                cont_home.courseCategory.result.length == 0
                    ? Container(
                        height: 75,
                        child: FutureBuilder(
                          future: cont_home.getCategory(),
                          builder: (context, data) {
                            if (data.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return ListBuilderCatagory(
                                  cont_home: cont_home,
                                  cont_home_btn: cont_home_btn);
                            }
                          },
                        ),
                      )
                    : Container(
                        height: 75,
                        child: ListBuilderCatagory(
                            cont_home: cont_home, cont_home_btn: cont_home_btn),
                      ),
                SizedBox(
                  height: 10,
                ),
                cont_home.resetbtnvisibility
                    ? Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.red)),
                            onPressed: () {
                              cont_home_btn.selectAllCourse();
                              cont_home_btn.setselctedIndex(512);
                              cont_home_btn.resetbtnvisibility = false;
                            },
                            child: Text("Clear filter"),
                          ),
                        ),
                      )
                    : SizedBox.shrink(),
                SizedBox(
                  height: 30,
                ),
                cont_home.selectedIndex == null
                    ? Container(
                        child: FutureBuilder(
                          future: cont_home.getallcourse(),
                          builder: (context, data) {
                            if (data.connectionState ==
                                ConnectionState.waiting) {
                              return Container(
                                height:
                                    MediaQuery.of(context).size.height / 1.5,
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            } else {
                              return ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      cont_home.allCourses.result!.length,
                                  itemBuilder: (context, i) {
                                    var data = cont_home.allCourses.result![i];
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
                                                        result: cont_home_btn
                                                            .allCourses
                                                            .result![i],
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
                      )
                    : Container(
                        child: cont_home.selectedCourse.length == 0
                            ? Container(
                                height:
                                    MediaQuery.of(context).size.height / 1.8,
                                child: Center(
                                  child: Text("No Courses available"),
                                ),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemCount: cont_home.selectedCourse.length,
                                itemBuilder: (context, i) {
                                  var data = cont_home.selectedCourse[i];

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
                                                      result: cont_home_btn
                                                          .selectedCourse[i],
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
                                }),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ListCoursesInitial extends StatelessWidget {
  final HomepageController cont_home;
  final HomepageController cont_home_btn;
  const ListCoursesInitial({
    Key? key,
    required this.cont_home,
    required this.cont_home_btn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ListBuilderCatagory extends StatelessWidget {
  const ListBuilderCatagory({
    Key? key,
    required this.cont_home,
    required this.cont_home_btn,
  }) : super(key: key);

  final HomepageController cont_home;
  final HomepageController cont_home_btn;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: cont_home.courseCategory.result.length,
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: () async {
              if (cont_home_btn.allCourseloaded) {
                cont_home_btn.setSelectedCourse(
                    cont_home_btn.courseCategory.result[i].categoryName, i);
                // orderData.setselctedIndex(i);
                cont_home_btn.setselctedIndex(i);
                cont_home_btn.resetbtnvisibility = true;
              } else {
                createSnackBar('Wait data is loaging', context);
              }
            },
            child: TopicCard(
              selected: cont_home.isSelected(
                  index: i, current: cont_home.selectedIndex),
              quantity: 1,
              title: cont_home.courseCategory.result[i].categoryName,
            ),
          );
        });
  }
}

class PageTitle extends StatelessWidget {
  final String s;
  const PageTitle(
    this.s, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 33, vertical: 25),
      child: Center(
        child: Text(
          s,
          style: TextStyle(
              fontSize: 24,
              fontFamily: 'Milliard',
              color: Color(0xff3D4C59),
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
