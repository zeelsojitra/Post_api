// To parse this JSON data, do
//
//     final getAllUser = getAllUserFromJson(jsonString);

import 'dart:convert';

GetAllUser? getAllUserFromJson(String str) =>
    GetAllUser.fromJson(json.decode(str));

String getAllUserToJson(GetAllUser? data) => json.encode(data!.toJson());

class GetAllUser {
  GetAllUser({
    this.status,
    this.message,
    this.userCount,
    this.users,
  });

  bool? status;
  String? message;
  int? userCount;
  List<User?>? users;

  factory GetAllUser.fromJson(Map<String, dynamic> json) => GetAllUser(
        status: json["status"],
        message: json["message"],
        userCount: json["user_count"],
        users: json["users"] == null
            ? []
            : List<User?>.from(json["users"]!.map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "user_count": userCount,
        "users": users == null
            ? []
            : List<dynamic>.from(users!.map((x) => x!.toJson())),
      };
}

class User {
  User({
    this.id,
    this.firstName,
    this.lastName,
    this.avatar,
    this.username,
    this.created,
  });

  String? id;
  String? firstName;
  String? lastName;
  String? avatar;
  String? username;
  String? created;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
        username: json["username"],
        created: json["created"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
        "username": username,
        "created": created,
      };
}
