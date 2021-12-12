// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

UserDetails userDetailsFromJson(String str) =>
    UserDetails.fromJson(json.decode(str));

String userDetailsToJson(UserDetails data) => json.encode(data.toJson());

class UserDetails {
  UserDetails({
    this.statuscode,
    this.message,
    this.result,
  });

  final int? statuscode;
  final String? message;
  final Result? result;

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        statuscode: json["statuscode"],
        message: json["message"],
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "statuscode": statuscode,
        "message": message,
        "result": result!.toJson(),
      };
}

class Result {
  Result({
    this.joiningDate,
    this.role,
    this.designation,
    this.events,
    this.courses,
    this.id,
    this.firstName,
    this.lastName,
    this.username,
    this.dateOfBirth,
    this.gender,
    this.phone,
    this.email,
    this.department,
    this.profilePic,
    this.university,
    this.experience,
    this.educationalQualification,
    this.referralSource,
    this.address,
    this.city,
    this.country,
    this.zip,
    this.facebook,
    this.linkedin,
    this.instagram,
    this.twitter,
    this.emergencyFirstName,
    this.emergencyLastName,
    this.emergencyPhone,
    this.emergencyEmail,
    this.recordingLink,
    this.recordingActive,
    this.encryptedPassword,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  final DateTime? joiningDate;
  final String? role;
  final String? designation;
  final List<dynamic>? events;
  final List<dynamic>? courses;
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? username;
  final DateTime? dateOfBirth;
  final String? gender;
  final String? phone;
  final String? email;
  final String? department;
  final String? profilePic;
  final String? university;
  final int? experience;
  final String? educationalQualification;
  final String? referralSource;
  final String? address;
  final String? city;
  final String? country;
  final int? zip;
  final String? facebook;
  final String? linkedin;
  final String? instagram;
  final String? twitter;
  final String? emergencyFirstName;
  final String? emergencyLastName;
  final String? emergencyPhone;
  final String? emergencyEmail;
  final String? recordingLink;
  final bool? recordingActive;
  final String? encryptedPassword;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        joiningDate: DateTime.parse(json["joining_date"]),
        role: json["role"],
        designation: json["designation"],
        events: List<dynamic>.from(json["events"].map((x) => x)),
        courses: List<dynamic>.from(json["courses"].map((x) => x)),
        id: json["_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        username: json["username"],
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        gender: json["gender"],
        phone: json["phone"],
        email: json["email"],
        department: json["department"],
        profilePic: json["profile_pic"],
        university: json["university"],
        experience: json["experience"],
        educationalQualification: json["educational_qualification"],
        referralSource: json["referral_source"],
        address: json["address"],
        city: json["city"],
        country: json["country"],
        zip: json["zip"],
        facebook: json["facebook"],
        linkedin: json["linkedin"],
        instagram: json["instagram"],
        twitter: json["twitter"],
        emergencyFirstName: json["emergency_first_name"],
        emergencyLastName: json["emergency_last_name"],
        emergencyPhone: json["emergency_phone"],
        emergencyEmail: json["emergency_email"],
        recordingLink: json["recording_link"],
        recordingActive: json["recording_active"],
        encryptedPassword: json["encrypted_password"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        v: json["__v"],
      );
  Map<String, dynamic> toJson() => {
        "joining_date": joiningDate!.toIso8601String(),
        "role": role,
        "designation": designation,
        "events": List<dynamic>.from(events!.map((x) => x)),
        "courses": List<dynamic>.from(courses!.map((x) => x)),
        "_id": id,
        "first_name": firstName,
        "last_name": lastName,
        "username": username,
        "date_of_birth": dateOfBirth!.toIso8601String(),
        "gender": gender,
        "phone": phone,
        "email": email,
        "department": department,
        "profile_pic": profilePic,
        "university": university,
        "experience": experience,
        "educational_qualification": educationalQualification,
        "referral_source": referralSource,
        "address": address,
        "city": city,
        "country": country,
        "zip": zip,
        "facebook": facebook,
        "linkedin": linkedin,
        "instagram": instagram,
        "twitter": twitter,
        "emergency_first_name": emergencyFirstName,
        "emergency_last_name": emergencyLastName,
        "emergency_phone": emergencyPhone,
        "emergency_email": emergencyEmail,
        "recording_link": recordingLink,
        "recording_active": recordingActive,
        "encrypted_password": encryptedPassword,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "__v": v,
      };
}
