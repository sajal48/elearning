import 'package:elearning/Api/apiservices.dart';
import 'package:elearning/Data/coursecategory.dart';
import 'package:elearning/Data/coursedata.dart' as coursedata;
import 'package:elearning/Data/purchase_response.dart';
import 'package:elearning/Data/userdetails.dart';
import 'package:elearning/screens/my_courses_screen.dart';

import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomepageController extends ChangeNotifier {
  late CourseCategory courseCategory;
  late coursedata.CourseData freeCourses;
  late coursedata.CourseData featuredCourses;
  late coursedata.CourseData allCourses;
  late List<coursedata.Result> myCourses = [];
  late UserDetails userDetails;
  String? userid;
  int page_index = 0;

  void set_PageIndex(int a) {
    page_index = a;
    print('page index $page_index');
    ChangeNotifier();
  }

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

  bool CoursePaid(String id) {
    bool temp = false;
    for (int i = 0; i < myCourses.length; i++) {
      if (myCourses[i].id == id) {
        temp = true;
      }
    }

    return temp;
  }

  Future<PurchaseResponse> purchase(
      String amount,
      String description,
      String email,
      String name,
      String course_id,
      String user_id,
      String course_name) async {
    String externalid =
        "uid_" + user_id + "_cid_" + course_id + "_cn_" + course_name;
    PurchaseResponse pr =
        await Services.purchase(amount, description, email, name, externalid);
    return pr;
  }

  Future<List<coursedata.Result>> getMyCourse() async {
    await getallcourse();
    print("getMyCourse called");
    if (myCourses.length > 0) {
      myCourses.clear();
      ChangeNotifier();
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? id = prefs.getString("RivguruUser");
    userid = id;
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
