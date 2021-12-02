import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:elearning/Data/coursecategory.dart';
import 'package:elearning/Data/coursedata.dart';

import 'package:elearning/Data/loginresponse.dart';
import 'package:elearning/Data/registerdata.dart';

import 'package:http/http.dart' as http;

class Services {
  static const String BASE_URL = "https://rivguru-course.herokuapp.com";
  static const String GET_CATEGORYLIST = BASE_URL + "/category";
  static const String GET_FEATUREDCOURSES =
      BASE_URL + "/course?course_featured=true";
  static const String GET_FREECOURSES =
      BASE_URL + "/course?course_paid=false&course_featured=true";
  static const String GET_ALLCOURSES = BASE_URL + "/course";
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
    print("getFeaturedPaidCourses called");
    Response response;
    try {
      response = await Dio().get(GET_FEATUREDCOURSES);
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

  static Future<CourseData> getFreeCourses() async {
    print("getFeaturedPaidCourses called");
    Response response;
    try {
      response = await Dio().get(GET_FREECOURSES);
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

  static Future<CourseData> getAllCourses() async {
    print("getFeaturedPaidCourses called");
    Response response;
    try {
      response = await Dio().get(GET_ALLCOURSES);
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
    var params = {"username": "$username", "password": "$password"};
    print(jsonEncode(params));
    try {
      final response = await http.post(Uri.parse(LOGIN_URL), body: params);

      if (response.statusCode == 201) {
        LoginResponse ls = LoginResponse.fromJson(jsonDecode(response.body));
        return ls;
      } else {
        return LoginResponse(
          message: "Login failed",
          statuscode: 0,
        );
      }
    } catch (e) {
      print('Error :' + e.toString());
      return LoginResponse(
        message: "Server error",
        statuscode: 0,
      );
    }
  }

  static Future<RegisterRespons> register(Registerdata registerdata) async {
    print(registerdata.address + registerdata.city + registerdata.email);
    var a = json.encode(registerdata);
    print("Register called");

    try {
      final response = await http.post(
        Uri.parse(REGISTER_URL),
        body: a,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print(response.body);
      if (response.statusCode == 201) {
        RegisterRespons rs =
            RegisterRespons.fromJson(jsonDecode(response.body));
        print("if ------" + response.body);
        return rs;
      } else {
        print("else ------" + response.body);
        return RegisterRespons(
          message: "Registration failed",
          statuscode: 0,
        );
      }
    } catch (e) {
      print(e.toString());
      return RegisterRespons(
        message: "Server error",
        statuscode: 0,
      );
    }
  }
}
