// To parse this JSON data, do
//
//     final registerdata = registerdataFromJson(jsonString);

import 'dart:convert';

Registerdata registerdataFromJson(String str) =>
    Registerdata.fromJson(json.decode(str));

String registerdataToJson(Registerdata data) => json.encode(data.toJson());

class Registerdata {
  Registerdata({
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.password,
    this.role = "default",
    required this.dateOfBirth,
    required this.joiningDate,
    required this.gender,
    required this.phone,
    required this.email,
    this.department = "default",
    this.profilePic = "default",
    this.university = "default",
    this.experience = 0,
    this.designation = "default",
    this.educationalQualification = "default",
    this.referralSource = "default",
    this.address = "default",
    this.city = "default",
    this.country = "default",
    this.zip = 0,
    this.facebook = "default",
    this.linkedin = "default",
    this.instagram = "default",
    this.twitter = "default",
    this.emergencyFirstName = "default",
    this.emergencyLastName = "default",
    this.emergencyPhone = "default",
    this.emergencyEmail = "default",
    this.recordingLink = "default",
    this.recordingActive = true,
  });

  String firstName;
  String lastName;
  String username;
  String password;
  String role;
  DateTime dateOfBirth;
  DateTime joiningDate;
  String gender;
  String phone;
  String email;
  String department;
  String profilePic;
  String university;
  int experience;
  String designation;
  String educationalQualification;
  String referralSource;
  String address;
  String city;
  String country;
  int zip;
  String facebook;
  String linkedin;
  String instagram;
  String twitter;
  String emergencyFirstName;
  String emergencyLastName;
  String emergencyPhone;
  String emergencyEmail;
  String recordingLink;
  bool recordingActive;

  factory Registerdata.fromJson(Map<String, dynamic> json) => Registerdata(
        firstName: json["first_name"],
        lastName: json["last_name"],
        username: json["username"],
        password: json["password"],
        role: json["role"],
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        joiningDate: DateTime.parse(json["joining_date"]),
        gender: json["gender"],
        phone: json["phone"],
        email: json["email"],
        department: json["department"],
        profilePic: json["profile_pic"],
        university: json["university"],
        experience: json["experience"],
        designation: json["designation"],
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
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "username": username,
        "password": password,
        "role": role,
        "date_of_birth": dateOfBirth.toIso8601String(),
        "joining_date": joiningDate.toIso8601String(),
        "gender": gender,
        "phone": phone,
        "email": email,
        "department": department,
        "profile_pic": profilePic,
        "university": university,
        "experience": experience,
        "designation": designation,
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
      };
}

// To parse this JSON data, do
//
//     final registerRespons = registerResponsFromJson(jsonString);

RegisterRespons registerResponsFromJson(String str) =>
    RegisterRespons.fromJson(json.decode(str));

String registerResponsToJson(RegisterRespons data) =>
    json.encode(data.toJson());

class RegisterRespons {
  RegisterRespons({
    required this.statuscode,
    this.message,
    this.result,
  });

  final int statuscode;
  final String? message;
  final result;

  factory RegisterRespons.fromJson(Map<String, dynamic> json) =>
      RegisterRespons(
        statuscode: json["statuscode"],
        message: json["message"],
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "statuscode": statuscode,
        "message": message,
        "result": result.toJson(),
      };
}

class Result {
  Result({
    this.id,
    this.firstName,
    this.lastname,
    this.email,
    this.response,
    this.status,
    this.message,
  });

  String? id;
  String? firstName;
  String? lastname;
  String? email;
  String? response;
  int? status;
  String? message;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["_id"],
        firstName: json["first_name"],
        lastname: json["lastname"],
        email: json["email"],
        response: json["response"],
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "first_name": firstName,
        "lastname": lastname,
        "email": email,
        "response": response,
        "status": status,
        "message": message,
      };
}
