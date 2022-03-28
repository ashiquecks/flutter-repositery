// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
  UserData({
    required this.message,
  });

  String message;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
