// To parse this JSON data, do
//
//     final featuredPaidCourses = featuredPaidCoursesFromJson(jsonString);

import 'dart:convert';

FeaturedPaidCourse featuredPaidCoursesFromJson(String str) =>
    FeaturedPaidCourse.fromJson(json.decode(str));

String featuredPaidCoursesToJson(FeaturedPaidCourse data) =>
    json.encode(data.toJson());

class FeaturedPaidCourse {
  FeaturedPaidCourse({
    required this.statuscode,
    required this.message,
    required this.result,
  });

  final int statuscode;
  final String message;
  final List<FeaturedPaidResult> result;

  factory FeaturedPaidCourse.fromJson(Map<String, dynamic> json) =>
      FeaturedPaidCourse(
        statuscode: json["statuscode"],
        message: json["message"],
        result: List<FeaturedPaidResult>.from(
            json["result"].map((x) => FeaturedPaidResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "statuscode": statuscode,
        "message": message,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class FeaturedPaidResult {
  FeaturedPaidResult({
    required this.coursePaid,
    required this.courseFeatured,
    required this.students,
    required this.modules,
    required this.quizPresent,
    required this.isPrivate,
    required this.id,
    required this.courseName,
    required this.trainer,
    required this.competency,
    required this.description,
    required this.aboutThisCourse,
    required this.whoThisCourseIsFor,
    required this.requirements,
    required this.whyToLearn,
    required this.skillsYouLearn,
    required this.category,
    required this.university,
    required this.courseType,
    required this.courseImage,
    required this.startDate,
    required this.endDate,
    required this.timeDuration,
    required this.price,
    required this.noOfModules,
    required this.v,
    required this.quizId,
  });

  final bool coursePaid;
  final bool courseFeatured;
  final List<String> students;
  final List<Module> modules;
  final bool quizPresent;
  final bool isPrivate;
  final String id;
  final String courseName;
  final Trainer trainer;
  final Competency competency;
  final String description;
  final String aboutThisCourse;
  final String whoThisCourseIsFor;
  final String requirements;
  final String whyToLearn;
  final String skillsYouLearn;
  final Category category;
  final String university;
  final String courseType;
  final String courseImage;
  final DateTime startDate;
  final DateTime endDate;
  final String timeDuration;
  final String price;
  final int noOfModules;
  final int v;
  final String quizId;

  factory FeaturedPaidResult.fromJson(Map<String, dynamic> json) =>
      FeaturedPaidResult(
        coursePaid: json["course_paid"],
        courseFeatured: json["course_featured"],
        students: List<String>.from(json["students"]!.map((x) => x)),
        modules:
            List<Module>.from(json["modules"]!.map((x) => Module.fromJson(x))),
        quizPresent: json["quiz_present"],
        isPrivate: json["is_private"],
        id: json["_id"],
        courseName: json["course_name"],
        trainer: trainerValues.map[json["trainer"]]!,
        competency: competencyValues.map[json["competency"]]!,
        description: json["description"],
        aboutThisCourse: json["about_this_course"],
        whoThisCourseIsFor: json["who_this_course_is_for"],
        requirements: json["requirements"],
        whyToLearn: json["why_to_learn"],
        skillsYouLearn: json["skills_you_learn"],
        category: categoryValues.map[json["category"]]!,
        university: json["university"],
        courseType: json["course_type"],
        courseImage: json["course_image"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        timeDuration: json["time_duration"],
        price: json["price"],
        noOfModules: json["no_of_modules"] ?? 0,
        v: json["__v"],
        quizId: json["quiz_id"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "course_paid": coursePaid,
        "course_featured": courseFeatured,
        "students": List<dynamic>.from(students.map((x) => x)),
        "modules": List<dynamic>.from(modules.map((x) => x.toJson())),
        "quiz_present": quizPresent,
        "is_private": isPrivate,
        "_id": id,
        "course_name": courseName,
        "trainer": trainerValues.reverse[trainer],
        "competency": competencyValues.reverse[competency],
        "description": description,
        "about_this_course": aboutThisCourse,
        "who_this_course_is_for": whoThisCourseIsFor,
        "requirements": requirements,
        "why_to_learn": whyToLearn,
        "skills_you_learn": skillsYouLearn,
        "category": categoryValues.reverse[category],
        "university": university,
        "course_type": courseTypeValues.reverse[courseType],
        "course_image": courseImage,
        "start_date": startDate.toIso8601String(),
        "end_date": endDate.toIso8601String(),
        "time_duration": timeDuration,
        "price": price,
        "no_of_modules": noOfModules,
        "__v": v,
        "quiz_id": quizId,
      };
}

enum Category { DEVELOPMENT, FINANCE_SYARIAH, WEB_DEVELOPMENT }

final categoryValues = EnumValues({
  "Development": Category.DEVELOPMENT,
  "Finance/ Syariah": Category.FINANCE_SYARIAH,
  "Web Development": Category.WEB_DEVELOPMENT
});

enum Competency { INTERMEDIATE, BEGINNER }

final competencyValues = EnumValues(
    {"Beginner": Competency.BEGINNER, "Intermediate": Competency.INTERMEDIATE});

enum CourseType { CATEGORY_2 }

final courseTypeValues = EnumValues({"Category 2": CourseType.CATEGORY_2});

class Module {
  Module(
      {required this.moduleName,
      required this.moduleDate,
      required this.timeLimit,
      required this.moduleReminder,
      required this.moduleType,
      required this.zoomLink,
      required this.resources});

  final String moduleName;
  final DateTime moduleDate;
  final String timeLimit;
  final String moduleReminder;
  final ModuleType moduleType;
  final String zoomLink;
  final String resources;

  factory Module.fromJson(Map<String, dynamic> json) => Module(
        moduleName: json["module_name"],
        moduleDate: DateTime.parse(json["module_date"]),
        timeLimit: json["time_limit"],
        moduleReminder: json["module_reminder"],
        moduleType: moduleTypeValues.map[json["module_type"]]!,
        zoomLink: json["zoom_link"] ?? "",
        resources: json["resources"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "module_name": moduleName,
        "module_date":
            "${moduleDate.year.toString().padLeft(4, '0')}-${moduleDate.month.toString().padLeft(2, '0')}-${moduleDate.day.toString().padLeft(2, '0')}",
        "time_limit": timeLimit,
        "module_reminder": moduleReminder,
        "module_type": moduleTypeValues.reverse[moduleType],
        "zoom_link": zoomLink,
      };
}

enum ModuleType { SELECT_LECTURE_TYPE, LIVE }

final moduleTypeValues = EnumValues({
  "Live": ModuleType.LIVE,
  "Select Lecture Type": ModuleType.SELECT_LECTURE_TYPE
});

enum Trainer { RIVGURU_EXPERT }

final trainerValues = EnumValues({"Rivguru Expert": Trainer.RIVGURU_EXPERT});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
