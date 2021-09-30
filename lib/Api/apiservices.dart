import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:elearning/Data/coursecategory.dart';
import 'package:elearning/Data/coursedata.dart';
import 'package:elearning/Data/loginresponse.dart';
import 'package:elearning/Data/registerdata.dart';

class Services {
  static const String BASE_URL = "https://rivguru-course.herokuapp.com";
  static const String GET_CATEGORYLIST = BASE_URL + "/category";
  static const String GET_FEATUREDPAIDCOURSES =
      BASE_URL + "/course?course_paid=false&course_featured=true";
  static const String LOGIN_URL =
      "https://rivguru-university.herokuapp.com/user/login";

  static const String REGISTER_URL =
      "https://rivguru-university.herokuapp.com/user";

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

  static Future<CourseData> getFeaturedCourses() async {
    print("getFeaturedCourses called");
    Response response;
    try {
      response = await Dio().get(GET_FEATUREDPAIDCOURSES);
      //print(response.data);

      return CourseData.fromJson(response.data);
    } catch (e) {
      print(e);
      return CourseData(
        message: "error",
        statuscode: 0,
        result: [],
      );
    }
  }

  static Future<LoginResponse> login(String username, String password) async {
    print("login called");
    Response response;
    var params = {"username": username, "password": password};
    try {
      response = await Dio().post(
        LOGIN_URL,
        data: jsonEncode(params),
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
      );
      //print(response.data);
      return LoginResponse.fromJson(response.data);
    } catch (e) {
      print('Error');
      return LoginResponse(
        message: "error",
        statuscode: 0,
      );
    }
  }

  static Future<RegisterRespons> register(Registerdata registerdata) async {
    print("Register called");
    Response response;

    try {
      response = await Dio().post(
        REGISTER_URL,
        data: registerdata.toJson(),
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
      );
      //print(response.data);
      return RegisterRespons.fromJson(response.data);
    } catch (e) {
      print('Error');
      return RegisterRespons(
        message: "error",
        statuscode: 0,
      );
    }
  }
}
