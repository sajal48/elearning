import 'package:elearning/Api/apiservices.dart';
import 'package:elearning/Data/coursecategory.dart';
import 'package:elearning/Data/featuredpaidcourses.dart';
import 'package:flutter/widgets.dart';

class HomepageController extends ChangeNotifier {
  late CourseCategory courseCategory;
  late FeaturedPaidCourses featuredPaidCourses;

  Future<CourseCategory> getCategory() async {
    courseCategory = await Services.getCourseCategory();
    ChangeNotifier();
    return courseCategory;
  }

  Future<FeaturedPaidCourses> getfpcourse() async {
    featuredPaidCourses = await Services.getFeaturedCourses();
    ChangeNotifier();
    return featuredPaidCourses;
  }
}
