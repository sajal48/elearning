import 'package:elearning/Api/apiservices.dart';
import 'package:elearning/Data/coursecategory.dart';
import 'package:elearning/Data/coursedata.dart';

import 'package:flutter/widgets.dart';

class HomepageController extends ChangeNotifier {
  late CourseCategory courseCategory;
  late CourseData featuredPaidCourses;
  late CourseData featuredCourse;

  Future<CourseCategory> getCategory() async {
    courseCategory = await Services.getCourseCategory();
    ChangeNotifier();
    return courseCategory;
  }

  Future<CourseData> getfpcourse() async {
    featuredPaidCourses = await Services.getFeaturedPaidCourses();
    ChangeNotifier();
    return featuredPaidCourses;
  }

  Future<CourseData> getfcourse() async {
    featuredCourse = await Services.getCourseDatas();
    ChangeNotifier();
    return featuredCourse;
  }
}
