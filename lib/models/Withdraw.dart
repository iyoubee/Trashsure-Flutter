// To parse this JSON data, do
//
//     final withdraw = withdrawFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<Withdraw> withdrawFromJson(String str) =>
    List<Withdraw>.from(json.decode(str).map((x) => Withdraw.fromJson(x)));

String withdrawToJson(List<Withdraw> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Withdraw {
  Withdraw({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory Withdraw.fromJson(Map<String, dynamic> json) => Withdraw(
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
    required this.date,
    required this.jumlah,
    required this.isApprove,
  });

  int user;
  DateTime date;
  String jumlah;
  String isApprove;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        date: DateTime.parse(json["date"]),
        jumlah: json["jumlah"],
        isApprove: json["isApprove"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "jumlah": jumlah,
        "isApprove": isApprove,
      };
}
