// To parse this JSON data, do
//
//     final testimoni = testimoniFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<Testimoni> testimoniFromJson(String str) =>
    List<Testimoni>.from(json.decode(str).map((x) => Testimoni.fromJson(x)));

String testimoniToJson(List<Testimoni> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Testimoni {
  Testimoni({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory Testimoni.fromJson(Map<String, dynamic> json) => Testimoni(
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
    required this.username,
    required this.desc,
  });

  int user;
  String username;
  String desc;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        username: json["username"],
        desc: json["desc"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "username": username,
        "desc": desc,
      };
}
