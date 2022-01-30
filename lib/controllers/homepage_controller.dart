import 'package:elearning/Api/apiservices.dart';
import 'package:elearning/Data/coursecategory.dart';
import 'package:elearning/Data/coursedata.dart' as coursedata;
import 'package:elearning/Data/purchase_response.dart';
import 'package:elearning/Data/userdetails.dart';

import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomepageController extends ChangeNotifier {
  CourseCategory courseCategory =
      CourseCategory(statuscode: 0, message: 'not loaded yet', result: []);
  coursedata.CourseData freeCourses = coursedata.CourseData(
      statuscode: 0, message: 'not loaded yet', result: []);
  late coursedata.CourseData featuredCourses;
  late coursedata.CourseData allCourses;
  late List<coursedata.Result> myCourses = [];
  late UserDetails userDetails;
  bool allCourseloaded = false;
  bool paidCourseloaded = false;
  bool freeCourseloaded = false;
  List<coursedata.Result> selectedCourse = [];
  int? selectedIndex;
  bool resetbtnvisibility = false;

  String? userid;
  int page_index = 0;

  bool isSelected({required int index, int? current}) {
    if (current != null) {
      if (current == index) {
        return true;
      }
      return false;
    }
    return false;
  }

  Future<String> enrollFree(String courseId) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    String? id = pref.getString("RivguruUser");

    String message = await Services.enrollFree(id!, courseId);
    return message;
  }

  void clearloaded() {
    allCourseloaded = false;
    paidCourseloaded = false;
    freeCourseloaded = false;
    notifyListeners();
  }

  void setselctedIndex(int? i) {
    selectedIndex = i;
    print('index now is $selectedIndex');
    notifyListeners();
  }

  void selectAllCourse() {
    selectedCourse.clear();
    allCourses.result!.forEach((element) {
      selectedCourse.add(element);
    });
  }

  void setSelectedCourse(String catagory, int index) {
    selectedCourse.clear();
    allCourses.result!.forEach((element) {
      if (element.category == catagory) {
        selectedCourse.add(element);
      }
    });
  }

  List<coursedata.Result> getcatagorycourses(String catagory) {
    List<coursedata.Result> a = [];
    allCourses.result!.forEach((element) {
      if (element.category == catagory) {
        a.add(element);
      }
    });
    print(
        'getcatagory courses length for $catagory is ${a.length} and allcourses length is ${allCourses.result!.length}');
    return a;
  }

  void set_PageIndex(int a) {
    page_index = a;
    print('page index $page_index');
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
    return userDetails;
  }

  Future<coursedata.CourseData> getfeaturedcourse() async {
    featuredCourses = await Services.getFeaturedCourses();
    paidCourseloaded = true;
    return featuredCourses;
  }

  Future<coursedata.CourseData> getfreecourse() async {
    freeCourses = await Services.getFreeCourses();
    freeCourseloaded = true;
    return freeCourses;
  }

  Future<coursedata.CourseData> getallcourse() async {
    allCourses = await Services.getAllCourses();
    allCourseloaded = true;
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
      }
    }
    print("getMyCourse data = $myCourses");

    return myCourses;
  }
}
