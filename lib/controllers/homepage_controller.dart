import 'package:elearning/Api/apiservices.dart';
import 'package:elearning/Data/coursecategory.dart';
import 'package:elearning/Data/featuredcourse.dart';
import 'package:elearning/Data/featurenpaidcourse.dart';
import 'package:flutter/widgets.dart';

class HomepageController extends ChangeNotifier {
  late CourseCategory courseCategory;
  late FeaturedPaidCourse featuredPaidCourses;
  late FeaturedCourse featuredCourse;

  Future<CourseCategory> getCategory() async {
    courseCategory = await Services.getCourseCategory();
    ChangeNotifier();
    return courseCategory;
  }

  Future<FeaturedPaidCourse> getfpcourse() async {
    featuredPaidCourses = await Services.getFeaturedPaidCourses();
    ChangeNotifier();
    return featuredPaidCourses;
  }

  Future<FeaturedCourse> getfcourse() async {
    featuredCourse = await Services.getFeaturedCourses();
    ChangeNotifier();
    return featuredCourse;
  }
}
