// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    required this.statuscode,
    required this.message,
    this.result,
  });

  final int statuscode;
  final String message;
  final Result? result;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
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
    required this.userId,
    required this.sessionKey,
    required this.userData,
  });

  final String userId;
  final String sessionKey;
  final UserData userData;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        userId: json["user_id"],
        sessionKey: json["session_key"],
        userData: UserData.fromJson(json["userData"]),
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "session_key": sessionKey,
        "userData": userData.toJson(),
      };
}

class UserData {
  UserData({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.university,
    required this.department,
    required this.role,
  });

  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String university;
  final String department;
  final String role;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        username: json["username"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        university: json["university"],
        department: json["department"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "university": university,
        "department": department,
        "role": role,
      };
}
