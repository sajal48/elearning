import 'package:elearning/Data/coursedata.dart';
import 'package:elearning/controllers/homepage_controller.dart';
import 'package:elearning/controllers/signup_login_controller.dart';
import 'package:elearning/screens/screens.dart';
import 'package:elearning/widgets/snack.dart';
import 'package:elearning/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'course_page_catagorywise.dart';

class HomeScreen extends StatefulWidget {
  final List<String> tcTitle = [
    'Pair of Linear Equations in Two Variables',
    'Pair of Linear Equations in Two Variables'
  ];
  final List<String> tcInstractor = ['Kerry Oaky', 'Gail Forcewind.'];
  final List<String> tcTime = ['4', '5'];
  final List<String> tcDuration = ['1 hours 40 min', '1 hours 20 min'];
  final List<String> cwpBanner = [
    'assets/images/chem.png',
    'assets/images/trigono.png'
  ];
  final List<String> cwpTitle = [
    'Introduction to\nTrigonometry',
    'Acids Bases\nand Salts'
  ];
  final List<String> cwpView = ['28,000', '40,000'];
  final List<String> cwpDuration = ['1 hours 40 min', '2 hours 40 min'];
  final List<String> cwpInstractor = ['Teri Dactyl', 'Allie Grater'];
  final List<String> cwpPrice = ['49.00', '55.00'];
  final List<String> cwpOfferPrice = ['99.00', '99.00'];
  final List<Color> cwpColor = [Colors.white, Colors.white];
  final List<String> cwpAvater = [
    'assets/images/ins_avater1.png',
    'assets/images/ins_avater2.png'
  ];
  final List<String> avater = [
    "0",
    "1",
    "2",
    "3",
  ];
  final List<String> name = [
    "Zack Lee",
    "Otto Matic",
    "Saul T. Balls",
    "Tara Zona",
  ];
  final List<String> insTitle = [
    "Specialist in math",
    "Specialist in math",
    "Specialist in physics",
    "Specialist in biology",
  ];
  final List<String> students = [
    "1200",
    "5000",
    "2500",
    "1340",
  ];
  final List<String> banner = [
    'assets/images/biology_basic.svg',
    'assets/images/physics.svg'
  ];
  final List<Color> color = [Color(0xff9EAFFF), Color(0xff8DCEB5)];
  final List<String> title = ['Biology Basic', 'Physics'];
  final List<String> subtitle = [
    'Biology & The Scientific Method',
    'Quantum \nPhysics'
  ];
  final List<String> hours = ['2-4', '3-4'];

  final List<String> categoryIcon = [
    'assets/images/physics_icon.svg',
    'assets/images/social_science_icon.svg',
    'assets/images/biology_icon.svg',
    'assets/images/math_icon.svg',
  ];
  final List<String> categoryTitle = [
    'Physics',
    'Social Science',
    'Biology',
    'Math'
  ];
  final List<Color> categoryColor = [
    Color(0xffFD8593),
    Color(0xff3C3B91),
    Color(0xff797BB8),
    Color(0xff6E92F6)
  ];
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> exampleList = [0, 1, 2, 3];

  @override
  Widget build(BuildContext context) {
    final cont_home = Provider.of<HomepageController>(context);
    final cont_home_btn =
        Provider.of<HomepageController>(context, listen: false);
    return SafeArea(
      child: Container(
        alignment: Alignment.centerLeft,
        color: Color(0xffF4F5F9),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              HomePageHeader(),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 33, vertical: 20),
                  child: Column(
                    children: [
                      // SizedBox(
                      //   height: 40,
                      // ),
                      // SearchBox(),
                      SizedBox(
                        height: 50,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Hi! What would you learn today?',
                          style: TextStyle(
                            fontFamily: 'Milliard',
                            color: Color(0xff3D4C59),
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 75,
                child: FutureBuilder(
                  future: cont_home.getCategory(),
                  builder: (context, data) {
                    if (data.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: cont_home.courseCategory.result.length,
                          itemBuilder: (context, i) {
                            return GestureDetector(
                              onTap: () async {
                                if (cont_home_btn.allCourseloaded) {
                                  List<Result> courselist = cont_home_btn
                                      .getcatagorycourses(cont_home_btn
                                          .courseCategory
                                          .result[i]
                                          .categoryName);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CoursePage_Catagorywise(
                                                courselist: courselist,
                                                title: cont_home_btn
                                                    .courseCategory
                                                    .result[i]
                                                    .categoryName,
                                              )));
                                  print(courselist.length);
                                } else {
                                  createSnackBar(
                                      'Wait data is loaging', context);
                                }
                              },
                              child: TopicCard(
                                quantity: 1,

                                color: widget.categoryColor[1],
                                // icon: widget.categoryIcon[1],
                                title: cont_home
                                    .courseCategory.result[i].categoryName,
                              ),
                            );
                          });
                    }
                  },
                ),
                // child: ListView.builder(
                //     physics: BouncingScrollPhysics(),
                //     scrollDirection: Axis.horizontal,
                //     itemCount: 4,
                //     itemBuilder: (context, i) {
                //       return TopicCard(
                //         color: widget.categoryColor[i],
                //         icon: widget.categoryIcon[i],
                //         title: widget.categoryTitle[i],
                //       );
                //     }),
              ),
              SizedBox(
                height: 50,
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 33),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text(
              //         'Popular Courses in Education',
              //         style: TextStyle(
              //           fontFamily: 'Milliard',
              //           color: Color(0xff3D4C59),
              //           fontSize: 21,
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //       Text('View All',
              //           style: TextStyle(
              //             color: Color(0xff5467FF),
              //           ))
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 17,
              // ),
              // Container(
              //   height: 260,
              //   child: ListView.builder(
              //       physics: BouncingScrollPhysics(),
              //       scrollDirection: Axis.horizontal,
              //       itemCount: 2,
              //       itemBuilder: (context, i) {
              //         return GestureDetector(
              //           onTap: () {
              //             Navigator.push(
              //                 context,
              //                 MaterialPageRoute(
              //                     builder: (context) => CoursePage()));
              //           },
              //           child: CourseCard(
              //               banner: widget.banner[i],
              //               title: widget.title[i],
              //               subtitle: widget.subtitle[i],
              //               hours: widget.hours[i],
              //               color: widget.color[i]),
              //         );
              //       }),
              // ),
              // SizedBox(
              //   height: 60,
              // ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 33.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text(
              //         'Top Instructor',
              //         style: TextStyle(
              //           fontFamily: 'Milliard',
              //           color: Color(0xff3D4C59),
              //           fontSize: 21,
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //       Text('View All',
              //           style: TextStyle(
              //             color: Color(0xff5467FF),
              //           ))
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 17,
              // ),
              // Container(
              //   height: 73,
              //   child: ListView.builder(
              //       physics: BouncingScrollPhysics(),
              //       scrollDirection: Axis.horizontal,
              //       itemCount: 4,
              //       itemBuilder: (context, i) {
              //         return InstractorStat(
              //             avater: i,
              //             name: widget.name[i],
              //             title: widget.insTitle[i],
              //             students: widget.students[i]);
              //       }),
              // ),
              // SizedBox(
              //   height: 50,
              // ),

              Padding(
                //Free Course section
                padding: const EdgeInsets.symmetric(horizontal: 33.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Free Courses',
                      style: TextStyle(
                        fontFamily: 'Milliard',
                        color: Color(0xff3D4C59),
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (Provider.of<HomepageController>(context,
                                listen: false)
                            .freeCourseloaded) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CoursePage_Catagorywise(
                                      title: 'All Free Courses',
                                      courselist:
                                          Provider.of<HomepageController>(
                                                  context,
                                                  listen: false)
                                              .freeCourses
                                              .result!)));
                        } else {
                          createSnackBar('Course loading', context);
                        }
                      },
                      child: Text('View All Free Courses',
                          style: TextStyle(
                            color: Color(0xff5467FF),
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 17,
              ),

              Container(
                height: 180,
                child: FutureBuilder(
                  future: cont_home.getfreecourse(),
                  builder: (context, data) {
                    if (data.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      print(Provider.of<HomepageController>(context)
                          .freeCourses
                          .result!
                          .length);
                      return ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: cont_home.freeCourses.result!.length,
                          itemBuilder: (context, i) {
                            var data = cont_home.freeCourses.result![i];
                            // print('\n');
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CourseDetailsScreen(
                                              result: cont_home_btn
                                                  .freeCourses.result![i],
                                            )));
                              },
                              child: CourseWithPrice(
                                isFree: !data.coursePaid!,
                                price: data.price!,
                                level: data.competency!,
                                duration: data.startDate.toString(),

                                module: data.noOfModules.toString(),

                                // instractor: widget.cwpInstractor[i],
                                // offerPrice: widget.cwpOfferPrice[i],
                                // view: widget.cwpView[i],
                                banner: data.courseImage!.toString(),
                                title: data.courseName!,
                                // color: widget.cwpColor[i],
                                // avater: widget.cwpAvater[i],
                              ),
                            );
                          });
                    }
                  },
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                //Paid Course section
                padding: const EdgeInsets.symmetric(horizontal: 33.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Paid Courses',
                      style: TextStyle(
                        fontFamily: 'Milliard',
                        color: Color(0xff3D4C59),
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (Provider.of<HomepageController>(context,
                                listen: false)
                            .paidCourseloaded) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CoursePage_Catagorywise(
                                      title: 'All Paid Courses',
                                      courselist:
                                          Provider.of<HomepageController>(
                                                  context,
                                                  listen: false)
                                              .featuredCourses
                                              .result!)));
                        } else {
                          createSnackBar('Course loading', context);
                        }
                      },
                      child: Text('View All Paid Courses',
                          style: TextStyle(
                            color: Color(0xff5467FF),
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 17,
              ),
              Container(
                height: 180,
                child: FutureBuilder(
                  future: cont_home.getfeaturedcourse(),
                  builder: (context, data) {
                    if (data.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      print(Provider.of<HomepageController>(context)
                          .featuredCourses
                          .result!
                          .length);
                      return ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: cont_home.featuredCourses.result!.length,
                          itemBuilder: (context, i) {
                            var data = cont_home.featuredCourses.result![i];
                            // print('\n');
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CourseDetailsScreen(
                                              result: cont_home_btn
                                                  .featuredCourses.result![i],
                                            )));
                              },
                              child: CourseWithPrice(
                                isFree: !data.coursePaid!,
                                price: data.price!,
                                level: data.competency!,
                                duration: data.startDate.toString(),

                                module: data.noOfModules.toString(),

                                // instractor: widget.cwpInstractor[i],
                                // offerPrice: widget.cwpOfferPrice[i],
                                // view: widget.cwpView[i],
                                banner: data.courseImage!.toString(),
                                title: data.courseName!,
                                // color: widget.cwpColor[i],
                                // avater: widget.cwpAvater[i],
                              ),
                            );
                          });
                    }
                  },
                ),
                // child: ListView.builder(
                //     physics: BouncingScrollPhysics(),
                //     scrollDirection: Axis.horizontal,
                //     itemCount: 2,
                //     itemBuilder: (context, i) {
                //       return CourseWithPrice(
                //         price: widget.cwpPrice[i],
                //         duration: widget.cwpDuration[i],
                //         instractor: widget.cwpInstractor[i],
                //         offerPrice: widget.cwpOfferPrice[i],
                //         view: widget.cwpView[i],
                //         banner: widget.cwpBanner[i],
                //         title: widget.cwpTitle[i],
                //         color: widget.cwpColor[i],
                //         avater: widget.cwpAvater[i],
                //       );
                //     }),
              ),

              SizedBox(
                height: 17,
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 33.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text(
              //         'My courses',
              //         style: TextStyle(
              //           fontFamily: 'Milliard',
              //           color: Color(0xff3D4C59),
              //           fontSize: 21,
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //       Text('View All',
              //           style: TextStyle(
              //             color: Color(0xff5467FF),
              //           ))
              //     ],
              //   ),
              // ),

              // Container(
              //   height: 180,
              //   child: FutureBuilder(
              //     future:
              //         Provider.of<HomepageController>(context).getallcourse(),
              //     builder: (context, data) {
              //       if (data.connectionState == ConnectionState.waiting) {
              //         return Center(
              //           child: CircularProgressIndicator(),
              //         );
              //       } else {
              //         return Consumer<HomepageController>(
              //           builder: (context, orderData, child) =>
              //               ListView.builder(
              //                   physics: BouncingScrollPhysics(),
              //                   scrollDirection: Axis.horizontal,
              //                   itemCount: orderData.allCourses.result!.length,
              //                   itemBuilder: (context, i) {
              //                     var data = orderData.allCourses.result![i];
              //                     // print('\n');
              //                     return GestureDetector(
              //                       onTap: () {
              //                         Navigator.push(
              //                             context,
              //                             MaterialPageRoute(
              //                                 builder: (context) =>
              //                                     CourseDetailsScreen(
              //                                       result: orderData
              //                                           .allCourses.result![i],
              //                                     )));
              //                       },
              //                       child: CourseWithPrice(
              //                         price: data.price!,
              //                         level: data.competency!.toString(),
              //                         duration: data.startDate!.toString(),
              //                         module: data.noOfModules!.toString(),

              //                         // instractor: widget.cwpInstractor[i],
              //                         // offerPrice: widget.cwpOfferPrice[i],
              //                         // view: widget.cwpView[i],
              //                         banner: data.courseImage.toString(),
              //                         title: data.courseName!,
              //                         // color: widget.cwpColor[i],
              //                         // avater: widget.cwpAvater[i],
              //                       ),
              //                     );
              //                   }),
              //         );
              //       }
              //     },
              //   ),
              // ),

              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 33),
              //   child: LiveClassCard(),
              // ),
              // SizedBox(
              //   height: 17,
              // ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 33),
              //   child: LiveClassCard(),
              // ),
              // SizedBox(
              //   height: 17,
              // )
            ],
          ),
        ),
      ),
    );
  }
}

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cont_sign = Provider.of<SignUpLoginController>(context);
    return Stack(
      children: [
        Positioned(
            child: Container(
          color: Colors.white,
          child: Image.asset('assets/images/banner_home.png'),
        )),
        // Positioned(
        //     left: 33,
        //     top: 25,
        //     child: SvgPicture.asset(
        //       'assets/images/profile_icon.svg',
        //       width: 20,
        //       height: 20,
        //     )),

        Positioned(
            left: 33,
            top: 100,
            child: Text(
              'Online\nEducation\nPlatform',
              style: TextStyle(
                  fontFamily: 'Milliard',
                  color: Colors.white,
                  fontSize: 33,
                  fontWeight: FontWeight.bold),
            )),
        cont_sign.loggedin
            ? SizedBox.shrink()
            : Positioned(
                left: 118,
                top: 80,
                child: SvgPicture.asset('assets/images/trial_icon.svg')),
        cont_sign.loggedin
            ? SizedBox.shrink()
            : Positioned(
                left: 33,
                top: 220,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpScreen()));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Color(0xff5467FF),
                        borderRadius: BorderRadius.circular(3)),
                    height: 35,
                    width: 96,
                    child: Text(
                      'START NOW',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Milliard',
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          letterSpacing: .7),
                    ),
                  ),
                ))
      ],
    );
  }
}
