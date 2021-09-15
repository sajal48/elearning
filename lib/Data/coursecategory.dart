// To parse this JSON data, do
//
//     final courseCategory = courseCategoryFromJson(jsonString);

import 'dart:convert';

CourseCategory courseCategoryFromJson(String str) =>
    CourseCategory.fromJson(json.decode(str));

String courseCategoryToJson(CourseCategory data) => json.encode(data.toJson());

class CourseCategory {
  CourseCategory({
    required this.statuscode,
    required this.message,
    required this.result,
  });

  final int statuscode;
  final String message;
  final List<Result> result;

  factory CourseCategory.fromJson(Map<String, dynamic> json) => CourseCategory(
        statuscode: json["statuscode"],
        message: json["message"],
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "statuscode": statuscode,
        "message": message,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    required this.id,
    required this.categoryName,
    required this.universityName,
    required this.v,
  });

  final String id;
  final String categoryName;
  final String universityName;
  final int v;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["_id"],
        categoryName: json["category_name"],
        universityName: json["university_name"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "category_name": categoryName,
        "university_name": universityName,
        "__v": v,
      };
}
