import 'package:elearning/Api/apiservices.dart';
import 'package:elearning/Data/coursecategory.dart';
import 'package:elearning/Data/coursedata.dart' as coursedata;

import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomepageController extends ChangeNotifier {
  late CourseCategory courseCategory;
  late coursedata.CourseData freeCourses;
  late coursedata.CourseData featuredCourses;
  late coursedata.CourseData allCourses;
  late List<coursedata.Result> myCourses;

  Future<CourseCategory> getCategory() async {
    courseCategory = await Services.getCourseCategory();
    ChangeNotifier();
    return courseCategory;
  }

  Future<coursedata.CourseData> getfeaturedcourse() async {
    featuredCourses = await Services.getFeaturedCourses();
    ChangeNotifier();
    return featuredCourses;
  }

  Future<coursedata.CourseData> getfreecourse() async {
    freeCourses = await Services.getFreeCourses();
    ChangeNotifier();
    return freeCourses;
  }

  Future<coursedata.CourseData> getallcourse() async {
    allCourses = await Services.getAllCourses();
    ChangeNotifier();
    return allCourses;
  }

  Future<void> getMyCourse() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? id = prefs.getString("userID");
    for (int i = 0; i < allCourses.result!.length; i++) {
      if (allCourses.result![i].students!.contains(id)) {
        myCourses.add(allCourses.result![i]);
      }
    }
    ChangeNotifier();
  }
}
