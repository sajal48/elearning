import 'package:elearning/Api/apiservices.dart';
import 'package:elearning/Data/coursecategory.dart';
import 'package:flutter/widgets.dart';

class HomepageController extends ChangeNotifier {
  late CourseCategory courseCategory;

  Future<CourseCategory> getCategory() async {
    courseCategory = await Services.getCourseCategory();
    ChangeNotifier();
    return courseCategory;
  }
}
