// To parse this JSON data, do
//
//     final deposit = depositFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<Deposit> depositFromJson(String str) =>
    List<Deposit>.from(json.decode(str).map((x) => Deposit.fromJson(x)));

String depositToJson(List<Deposit> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Deposit {
  Deposit({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory Deposit.fromJson(Map<String, dynamic> json) => Deposit(
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
    required this.username,
    required this.jenisSampah,
    required this.beratSampah,
    required this.poin,
    required this.totalHarga,
    required this.isApprove,
  });

  int user;
  DateTime date;
  String username;
  String jenisSampah;
  int beratSampah;
  int poin;
  int totalHarga;
  String isApprove;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        date: DateTime.parse(json["date"]),
        username: json["username"],
        jenisSampah: json["jenisSampah"],
        beratSampah: json["beratSampah"],
        poin: json["poin"],
        totalHarga: json["totalHarga"],
        isApprove: json["isApprove"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "username": username,
        "jenisSampah": jenisSampah,
        "beratSampah": beratSampah,
        "poin": poin,
        "totalHarga": totalHarga,
        "isApprove": isApprove,
      };
}
