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

  final String? joiningDate;
  final String? role;
  final String? designation;
  final List<dynamic>? events;
  final List<dynamic>? courses;
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? username;
  final String? dateOfBirth;
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
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        joiningDate: json["joining_date"] ?? DateTime.now().toString(),
        role: json["role"] ?? "null value",
        designation: json["designation"] ?? "null value",
        events: List<dynamic>.from(json["events"].map((x) => x)),
        courses: List<dynamic>.from(json["courses"].map((x) => x)),
        id: json["_id"] ?? "null value",
        firstName: json["first_name"] ?? "null value",
        lastName: json["last_name"] ?? "null value",
        username: json["username"] ?? "null value",
        dateOfBirth: json["date_of_birth"] ?? DateTime.now().toString(),
        gender: json["gender"] ?? "null value",
        phone: json["phone"] ?? "null value",
        email: json["email"] ?? "null value",
        department: json["department"] ?? "null value",
        profilePic: json["profile_pic"] ?? "null value",
        university: json["university"] ?? "null value",
        experience: json["experience"] ?? 0,
        educationalQualification:
            json["educational_qualification"] ?? "null value",
        referralSource: json["referral_source"] ?? "null value",
        address: json["address"] ?? "null value",
        city: json["city"] ?? "null value",
        country: json["country"] ?? "null value",
        zip: json["zip"] ?? 0,
        facebook: json["facebook"] ?? "null value",
        linkedin: json["linkedin"] ?? "null value",
        instagram: json["instagram"] ?? "null value",
        twitter: json["twitter"] ?? "null value",
        emergencyFirstName: json["emergency_first_name"] ?? "null value",
        emergencyLastName: json["emergency_last_name"] ?? "null value",
        emergencyPhone: json["emergency_phone"] ?? "null value",
        emergencyEmail: json["emergency_email"] ?? "null value",
        recordingLink: json["recording_link"] ?? "null value",
        recordingActive: json["recording_active"] ?? false,
        encryptedPassword: json["encrypted_password"] ?? "null value",
        createdAt: json["created_at"] ?? DateTime.now().toString(),
        updatedAt: json["updated_at"] ?? DateTime.now().toString(),
        v: json["__v"] ?? 0,
      );
  Map<String, dynamic> toJson() => {
        "joining_date": joiningDate!,
        "role": role,
        "designation": designation,
        "events": List<dynamic>.from(events!.map((x) => x)),
        "courses": List<dynamic>.from(courses!.map((x) => x)),
        "_id": id,
        "first_name": firstName,
        "last_name": lastName,
        "username": username,
        "date_of_birth": dateOfBirth!,
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
        "created_at": createdAt!,
        "updated_at": updatedAt!,
        "__v": v,
      };
}
