// To parse this JSON data, do
//
//     final redeemedPrize = redeemedPrizeFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<RedeemedPrize> redeemedPrizeFromJson(String str) =>
    List<RedeemedPrize>.from(
        json.decode(str).map((x) => RedeemedPrize.fromJson(x)));

String redeemedPrizeToJson(List<RedeemedPrize> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RedeemedPrize {
  RedeemedPrize({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory RedeemedPrize.fromJson(Map<String, dynamic> json) => RedeemedPrize(
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
    required this.stok,
    required this.nama,
    required this.desc,
  });

  int user;
  int stok;
  String nama;
  String desc;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        stok: json["stok"],
        nama: json["nama"],
        desc: json["desc"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "stok": stok,
        "nama": nama,
        "desc": desc,
      };
}
