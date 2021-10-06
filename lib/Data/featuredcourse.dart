import 'dart:convert';

FeaturedCourse featuredCourseFromJson(String str) =>
    FeaturedCourse.fromJson(json.decode(str));

String featuredCourseToJson(FeaturedCourse data) => json.encode(data.toJson());

class FeaturedCourse {
  FeaturedCourse({
    required this.statuscode,
    required this.message,
    required this.result,
  });

  final int statuscode;
  final String message;
  final List<FeaturedResult> result;

  factory FeaturedCourse.fromJson(Map<String, dynamic> json) => FeaturedCourse(
        statuscode: json["statuscode"],
        message: json["message"],
        result: List<FeaturedResult>.from(
            json["result"].map((x) => FeaturedResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "statuscode": statuscode,
        "message": message,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class FeaturedResult {
  FeaturedResult({
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

  factory FeaturedResult.fromJson(Map<String, dynamic> json) => FeaturedResult(
        coursePaid: json["course_paid"],
        courseFeatured: json["course_featured"],
        students: List<dynamic>.from(json["students"].map((x) => x)),
        modules:
            List<Module>.from(json["modules"].map((x) => Module.fromJson(x))),
        quizPresent: json["quiz_present"],
        isPrivate: json["is_private"],
        id: json["_id"],
        courseName: json["course_name"],
        trainer: json["trainer"],
        competency: json["competency"],
        description: json["description"],
        aboutThisCourse: json["about_this_course"],
        whoThisCourseIsFor: json["who_this_course_is_for"],
        requirements: json["requirements"],
        whyToLearn: json["why_to_learn"],
        skillsYouLearn: json["skills_you_learn"],
        category: json["category"],
        university: json["university"],
        courseType: json["course_type"],
        courseImage: json["course_image"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        timeDuration: json["time_duration"],
        price: json["price"],
        noOfModules: json["no_of_modules"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        v: json["__v"],
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
  Module({
    required this.moduleName,
    required this.moduleDate,
    required this.timeLimit,
    required this.moduleReminder,
    required this.moduleType,
    required this.zoomLink,
    required this.resources,
  });

  final String moduleName;
  final DateTime moduleDate;
  final String timeLimit;
  final DateTime moduleReminder;
  final String moduleType;
  final String zoomLink;
  final String resources;

  factory Module.fromJson(Map<String, dynamic> json) => Module(
        moduleName: json["module_name"],
        moduleDate: DateTime.parse(json["module_date"]),
        timeLimit: json["time_limit"],
        moduleReminder: DateTime.parse(json["module_reminder"]),
        moduleType: json["module_type"],
        zoomLink: json["zoom_link"],
        resources: json["resources"] == null ? null : json["resources"],
      );

  Map<String, dynamic> toJson() => {
        "module_name": moduleName,
        "module_date":
            "${moduleDate.year.toString().padLeft(4, '0')}-${moduleDate.month.toString().padLeft(2, '0')}-${moduleDate.day.toString().padLeft(2, '0')}",
        "time_limit": timeLimit,
        "module_reminder":
            "${moduleReminder.year.toString().padLeft(4, '0')}-${moduleReminder.month.toString().padLeft(2, '0')}-${moduleReminder.day.toString().padLeft(2, '0')}",
        "module_type": moduleType,
        "zoom_link": zoomLink,
        "resources": resources == null ? null : resources,
      };
}
