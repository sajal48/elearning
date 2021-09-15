import 'package:dio/dio.dart';
import 'package:elearning/Data/coursecategory.dart';

class Services {
  static const String BASE_URL = "https://rivguru-course.herokuapp.com";
  static const String GET_CATEGORYLIST = BASE_URL + "/category";

  static Future<CourseCategory> getCourseCategory() async {
    var response;
    try {
      response = await Dio().get(GET_CATEGORYLIST);
      if (200 == response.statusCode) {
        print(response);
        return response;
      } else {
        return response;
      }
    } catch (e) {
      print(e);
      return response;
    }
  }
}
