import 'dart:convert';

import 'package:intl/intl.dart';

CourseData courseDataFromJson(String str) =>
    CourseData.fromJson(json.decode(str));

String courseDataToJson(CourseData data) => json.encode(data.toJson());

final DateFormat df = DateFormat('yyyy-MM-dd');

class CourseData {
  CourseData({
    required this.statuscode,
    required this.message,
    required this.result,
  });

  final int statuscode;
  final String message;
  final List<Result>? result;

  factory CourseData.fromJson(Map<String, dynamic> json) => CourseData(
        statuscode: json["statuscode"] == null ? null : json["statuscode"],
        message: json["message"] == null ? null : json["message"],
        result: json["result"] == null
            ? null
            : List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "statuscode": statuscode == null ? null : statuscode,
        "message": message == null ? null : message,
        "result": result == null
            ? null
            : List<dynamic>.from(result!.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    this.coursePaid,
    this.courseFeatured,
    this.students,
    this.modules,
    this.quizPresent,
    this.isPrivate,
    this.id,
    this.courseName,
    this.trainer,
    this.competency,
    this.description,
    this.youtubeLink,
    this.aboutThisCourse,
    this.whoThisCourseIsFor,
    this.requirements,
    this.whyToLearn,
    this.skillsYouLearn,
    this.category,
    this.university,
    this.courseType,
    this.courseImage,
    this.startDate,
    this.endDate,
    this.timeDuration,
    this.price,
    this.noOfModules,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.quizId,
  });

  final bool? coursePaid;
  final bool? courseFeatured;
  final List<dynamic>? students;
  final List<dynamic>? modules;
  final bool? quizPresent;
  final bool? isPrivate;
  final String? id;
  final String? courseName;
  final String? trainer;
  final String? competency;
  final String? description;
  final String? youtubeLink;
  final String? aboutThisCourse;
  final String? whoThisCourseIsFor;
  final String? requirements;
  final String? whyToLearn;
  final String? skillsYouLearn;
  final String? category;
  final String? university;
  final String? courseType;
  final String? courseImage;
  final String? startDate;
  final String? endDate;
  final String? timeDuration;
  final String? price;
  final int? noOfModules;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? quizId;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        coursePaid: json["course_paid"] ?? null,
        courseFeatured: json["course_featured"] ?? null,
        students: json["students"] == null
            ? null
            : List<dynamic>.from(json["students"].map((x) => x)),
        modules: json["modules"] == null
            ? null
            : List<dynamic>.from(json["modules"].map((x) => x)),
        quizPresent: json["quiz_present"] ?? null,
        isPrivate: json["is_private"] ?? null,
        id: json["_id"] ?? null,
        courseName: json["course_name"] ?? null,
        trainer: json["trainer"] ?? null,
        competency: json["competency"] ?? null,
        description: json["description"] ?? null,
        youtubeLink: json["youtube_link"] ?? null,
        aboutThisCourse: json["about_this_course"] ?? null,
        whoThisCourseIsFor: json["who_this_course_is_for"] ?? null,
        requirements: json["requirements"] ?? null,
        whyToLearn: json["why_to_learn"] ?? null,
        skillsYouLearn: json["skills_you_learn"] ?? null,
        category: json["category"] ?? null,
        university: json["university"] ?? null,
        courseType: json["course_type"] ?? null,
        courseImage: json["course_image"] ?? null,
        startDate: json["start_date"] == null
            ? null
            : df.format(DateTime.parse(json["start_date"])),
        endDate: json["end_date"] == null
            ? null
            : df.format(DateTime.parse(json["end_date"])),
        timeDuration: json["time_duration"] ?? null,
        price: json["price"] ?? null,
        noOfModules: json["no_of_modules"] ?? null,
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        v: json["__v"] ?? null,
        quizId: json["quiz_id"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "course_paid": coursePaid == null ? null : coursePaid,
        "course_featured": courseFeatured == null ? null : courseFeatured,
        "students": students == null
            ? null
            : List<dynamic>.from(students!.map((x) => x)),
        "modules":
            modules == null ? null : List<dynamic>.from(modules!.map((x) => x)),
        "quiz_present": quizPresent == null ? null : quizPresent,
        "is_private": isPrivate == null ? null : isPrivate,
        "_id": id == null ? null : id,
        "course_name": courseName == null ? null : courseName,
        "trainer": trainer == null ? null : trainer,
        "competency": competency == null ? null : competency,
        "description": description == null ? null : description,
        "youtube_link": youtubeLink == null ? null : youtubeLink,
        "about_this_course": aboutThisCourse == null ? null : aboutThisCourse,
        "who_this_course_is_for":
            whoThisCourseIsFor == null ? null : whoThisCourseIsFor,
        "requirements": requirements == null ? null : requirements,
        "why_to_learn": whyToLearn == null ? null : whyToLearn,
        "skills_you_learn": skillsYouLearn == null ? null : skillsYouLearn,
        "category": category == null ? null : category,
        "university": university == null ? null : university,
        "course_type": courseType == null ? null : courseType,
        "course_image": courseImage == null ? null : courseImage,
        "start_date": startDate == null ? null : startDate,
        "end_date": endDate == null ? null : endDate,
        "time_duration": timeDuration == null ? null : timeDuration,
        "price": price == null ? null : price,
        "no_of_modules": noOfModules == null ? null : noOfModules,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "__v": v == null ? null : v,
        "quiz_id": quizId == null ? null : quizId,
      };
}

class ModuleClass {
  ModuleClass({
    this.moduleName,
    this.moduleDate,
    this.timeLimit,
    this.moduleReminder,
    this.resources,
    this.uploadLecture,
    this.zoomLink,
    this.moduleType,
    this.moduleId,
  });

  final String? moduleName;
  final String? moduleDate;
  final String? timeLimit;
  final String? moduleReminder;
  final String? resources;
  final String? uploadLecture;
  final String? zoomLink;
  final String? moduleType;
  final int? moduleId;

  factory ModuleClass.fromJson(Map<String, dynamic> json) => ModuleClass(
        moduleName: json["module_name"] ?? null,
        moduleDate: json["module_date"] ?? null,
        timeLimit: json["time_limit"] ?? null,
        moduleReminder: json["module_reminder"] ?? null,
        resources: json["resources"] ?? null,
        uploadLecture: json["upload_lecture"] ?? null,
        zoomLink: json["zoom_link"] ?? null,
        moduleType: json["module_type"] ?? null,
        moduleId: json["module_id"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "module_name": moduleName ?? null,
        "module_date": moduleDate ?? null,
        "time_limit": timeLimit ?? null,
        "module_reminder": moduleReminder ?? null,
        "resources": resources ?? null,
        "upload_lecture": uploadLecture ?? null,
        "zoom_link": zoomLink ?? null,
        "module_type": moduleType ?? null,
        "module_id": moduleId ?? null,
      };
}
