// To parse this JSON data, do
//
//     final prize = prizeFromJson(jsonString);

import 'dart:convert';

List<Prize> prizeFromJson(String str) =>
    List<Prize>.from(json.decode(str).map((x) => Prize.fromJson(x)));

String prizeToJson(List<Prize> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Prize {
  Prize({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory Prize.fromJson(Map<String, dynamic> json) => Prize(
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
    required this.nama,
    required this.poin,
    required this.stok,
    required this.desc,
  });

  String nama;
  int poin;
  int stok;
  String desc;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        nama: json["nama"],
        poin: json["poin"],
        stok: json["stok"],
        desc: json["desc"],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "poin": poin,
        "stok": stok,
        "desc": desc,
      };
}
