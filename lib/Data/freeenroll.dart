// To parse this JSON data, do
//
//     final freeenroll = freeenrollFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Freeenroll freeenrollFromJson(String str) =>
    Freeenroll.fromJson(json.decode(str));

String freeenrollToJson(Freeenroll data) => json.encode(data.toJson());

class Freeenroll {
  Freeenroll({
    required this.courseId,
    required this.userId,
  });

  final String courseId;
  final List<String> userId;

  factory Freeenroll.fromJson(Map<String, dynamic> json) => Freeenroll(
        courseId: json["course_id"],
        userId: List<String>.from(json["user_id"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "course_id": courseId,
        "user_id": List<dynamic>.from(userId.map((x) => x)),
      };
}
