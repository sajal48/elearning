import 'dart:convert';

CourseData featuredCourseFromJson(String str) =>
    CourseData.fromJson(json.decode(str));

String featuredCourseToJson(CourseData data) => json.encode(data.toJson());

class CourseData {
  CourseData({
    required this.statuscode,
    required this.message,
    required this.result,
  });

  final int statuscode;
  final String message;
  final List<Result> result;

  factory CourseData.fromJson(Map<String, dynamic> json) => CourseData(
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
    required this.createdAt,
    required this.updatedAt,
    required this.quizId,
    required this.v,
  });

  final bool coursePaid;
  final bool courseFeatured;
  final List<dynamic> students;
  final List<Module> modules;
  final bool quizPresent;
  final bool isPrivate;
  final String id;
  final String courseName;
  final String trainer;
  final String competency;
  final String description;
  final String aboutThisCourse;
  final String whoThisCourseIsFor;
  final String requirements;
  final String whyToLearn;
  final String skillsYouLearn;
  final String category;
  final String university;
  final String courseType;
  final String courseImage;
  final DateTime startDate;
  final DateTime endDate;
  final String timeDuration;
  final String price;
  final int noOfModules;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final String quizId;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        coursePaid: json["course_paid"],
        courseFeatured: json["course_featured"],
        students: List<dynamic>.from(json["students"].map((x) => x)),
        modules:
            List<Module>.from(json["modules"].map((x) => Module.fromJson(x))),
        quizPresent: json["quiz_present"],
        isPrivate: json["is_private"],
        id: json["_id"],
        courseName: json["course_name"] ?? "not defined",
        trainer: json["trainer"] ?? "not defined",
        competency: json["competency"] ?? "not defined",
        description: json["description"] ?? "not defined",
        aboutThisCourse: json["about_this_course"] ?? "not defined",
        whoThisCourseIsFor: json["who_this_course_is_for"] ?? "not defined",
        requirements: json["requirements"] ?? "not defined",
        whyToLearn: json["why_to_learn"] ?? "not defined",
        skillsYouLearn: json["skills_you_learn"] ?? "not defined",
        category: json["category"] ?? "not defined",
        university: json["university"] ?? "not defined",
        courseType: json["course_type"] ?? "not defined",
        courseImage: json["course_image"] ?? "not defined",
        startDate: nullchecker(json["start_date"]),
        endDate: nullchecker(json["end_date"]),
        timeDuration: json["time_duration"] ?? "not defined",
        price: json["price"] ?? "not defined",
        noOfModules: json["no_of_modules"] ?? 0,
        createdAt: nullchecker(json["created_at"]),
        updatedAt: nullchecker(json["updated_at"]),
        v: json["__v"] ?? 0,
        quizId: json["quiz_id"] ?? "not defined",
      );

  Map<String, dynamic> toJson() => {
        "quiz_id": quizId,
        "course_paid": coursePaid,
        "course_featured": courseFeatured,
        "students": List<dynamic>.from(students.map((x) => x)),
        "modules": List<dynamic>.from(modules.map((x) => x.toJson())),
        "quiz_present": quizPresent,
        "is_private": isPrivate,
        "_id": id,
        "course_name": courseName,
        "trainer": trainer,
        "competency": competency,
        "description": description,
        "about_this_course": aboutThisCourse,
        "who_this_course_is_for": whoThisCourseIsFor,
        "requirements": requirements,
        "why_to_learn": whyToLearn,
        "skills_you_learn": skillsYouLearn,
        "category": category,
        "university": university,
        "course_type": courseType,
        "course_image": courseImage,
        "start_date": startDate.toIso8601String(),
        "end_date": endDate.toIso8601String(),
        "time_duration": timeDuration,
        "price": price,
        "no_of_modules": noOfModules,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "__v": v,
      };
}

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
  final DateTime moduleReminder;
  final String moduleType;
  final String zoomLink;
  final String resources;

  factory Module.fromJson(Map<String, dynamic> json) => Module(
        moduleName: json["module_name"] ?? "not defined",
        moduleDate: nullchecker(json["module_date"]),
        timeLimit: json["time_limit"] == ""
            ? "2021-10-30T00:00:00.000Z"
            : json["time_limit"],
        moduleReminder: nullchecker(json["module_reminder"]),
        moduleType: json["module_type"],
        zoomLink: json["zoom_link"] ?? "Not defined",
        resources: json["resources"] ?? "Not defined",
      );

  Map<String, dynamic> toJson() => {
        "module_name": moduleName,
        "module_date":
            "${moduleDate.year.toString().padLeft(4, '0')}-${moduleDate.month.toString().padLeft(2, '0')}-${moduleDate.day.toString().padLeft(2, '0')}",
        "time_limit": timeLimit,
        "module_reminder": moduleReminder,
        "module_type": moduleType,
        "zoom_link": zoomLink,
      };
}

DateTime nullchecker(String? d) {
  if (d == null || d == "") {
    return DateTime.parse("2021-10-30T00:00:00.000Z");
  } else {
    return DateTime.parse(d);
  }
}
