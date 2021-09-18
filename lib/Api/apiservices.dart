import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:elearning/Data/coursecategory.dart';
import 'package:elearning/Data/featuredpaidcourses.dart';

class Services {
  static const String BASE_URL = "https://rivguru-course.herokuapp.com";
  static const String GET_CATEGORYLIST = BASE_URL + "/category";
  static const String GET_FEATUREDPAIDCOURSES =
      BASE_URL + "/course?course_paid=true&course_featured=true";

  static Future<CourseCategory> getCourseCategory() async {
    print("getCourseCategory called");
    Response response;
    try {
      response = await Dio().get(GET_CATEGORYLIST);

      if (200 == response.statusCode) {
        // print(response);

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

  static Future<FeaturedPaidCourses> getFeaturedCourses() async {
    print("getFeaturedCourses called");
    Response response;
    try {
      response = await Dio().get(GET_FEATUREDPAIDCOURSES);
      //print(response.data);

      return FeaturedPaidCourses.fromJson(response.data);
    } catch (e) {
      print('Error');
      return FeaturedPaidCourses(
        message: "error",
        statuscode: 0,
        result: [],
      );
    }
  }
}
