import 'package:elearning/Api/apiservices.dart';
import 'package:elearning/Data/coursecategory.dart';
import 'package:elearning/Data/coursedata.dart';

import 'package:flutter/widgets.dart';

class HomepageController extends ChangeNotifier {
  late CourseCategory courseCategory;
  late CourseData freeCourses;
  late CourseData featuredCourses;
  late CourseData allCourses;

  Future<CourseCategory> getCategory() async {
    courseCategory = await Services.getCourseCategory();
    ChangeNotifier();
    return courseCategory;
  }

  Future<CourseData> getfeaturedcourse() async {
    featuredCourses = await Services.getFeaturedCourses();
    ChangeNotifier();
    return featuredCourses;
  }

  Future<CourseData> getfreecourse() async {
    freeCourses = await Services.getFreeCourses();
    ChangeNotifier();
    return freeCourses;
  }

  Future<CourseData> getallcourse() async {
    allCourses = await Services.getAllCourses();
    ChangeNotifier();
    return allCourses;
  }
}
