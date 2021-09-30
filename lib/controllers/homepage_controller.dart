import 'package:elearning/Api/apiservices.dart';
import 'package:elearning/Data/coursecategory.dart';
import 'package:elearning/Data/coursedata.dart';
import 'package:flutter/widgets.dart';

class HomepageController extends ChangeNotifier {
  late CourseCategory courseCategory;
  late CourseData featuredPaidCourses;

  Future<CourseCategory> getCategory() async {
    courseCategory = await Services.getCourseCategory();
    ChangeNotifier();
    return courseCategory;
  }

  Future<CourseData> getfpcourse() async {
    featuredPaidCourses = await Services.getFeaturedCourses();
    ChangeNotifier();
    return featuredPaidCourses;
  }
}
