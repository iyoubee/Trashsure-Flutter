// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

List<UserData> userDataFromJson(String str) =>
    List<UserData>.from(json.decode(str).map((x) => UserData.fromJson(x)));

String userDataToJson(List<UserData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserData {
  UserData({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  Fields({
    required this.user,
    required this.email,
    required this.poin,
    required this.balance,
  });

  int user;
  String email;
  int poin;
  int balance;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        email: json["email"],
        poin: json["poin"],
        balance: json["balance"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "email": email,
        "poin": poin,
        "balance": balance,
      };
}
