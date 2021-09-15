import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:elearning/Data/coursecategory.dart';

class Services {
  static const String BASE_URL = "https://rivguru-course.herokuapp.com";
  static const String GET_CATEGORYLIST = BASE_URL + "/category";

  static Future<CourseCategory> getCourseCategory() async {
    print("getCourseCategory called");
    Response response;
    try {
      response = await Dio().get(GET_CATEGORYLIST);

      if (200 == response.statusCode) {
        print(response);

        return CourseCategory.fromJson(response.data);
      } else {
        print("error occured");
        return CourseCategory(message: "null", result: [], statuscode: 0);
      }
    } catch (e) {
      print(e);
      return CourseCategory(message: "null", result: [], statuscode: 0);
    }
  }
}
