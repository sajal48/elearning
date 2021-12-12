import 'package:elearning/Api/apiservices.dart';
import 'package:elearning/Data/coursecategory.dart';
import 'package:elearning/Data/coursedata.dart' as coursedata;
import 'package:elearning/Data/userdetails.dart';

import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomepageController extends ChangeNotifier {
  late CourseCategory courseCategory;
  late coursedata.CourseData freeCourses;
  late coursedata.CourseData featuredCourses;
  late coursedata.CourseData allCourses;
  late List<coursedata.Result> myCourses = [];
  late UserDetails userDetails;

  Future<CourseCategory> getCategory() async {
    courseCategory = await Services.getCourseCategory();
    ChangeNotifier();
    return courseCategory;
  }

  Future<UserDetails> getUserDetails() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    String? id = pref.getString("RivguruUser");
    print("id got from sf  : $id");
    userDetails = await Services.getUserData(id!);

    ChangeNotifier();
    return userDetails;
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

  Future<List<coursedata.Result>> getMyCourse() async {
    await getallcourse();
    myCourses = [];
    print("getMyCourse called");
    if (myCourses.length > 0) {
      myCourses.clear();
      ChangeNotifier();
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? id = prefs.getString("RivguruUser");
    print("id = $id");
    for (int i = 0; i < allCourses.result!.length; i++) {
      if (allCourses.result![i].students!.contains(id)) {
        myCourses.add(allCourses.result![i]);
        ChangeNotifier();
      }
    }
    print("getMyCourse data = $myCourses");
    ChangeNotifier();
    return myCourses;
  }
}
