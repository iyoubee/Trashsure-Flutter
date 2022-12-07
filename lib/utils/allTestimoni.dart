import 'package:trashsure/models/Testimoni.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AllTestimoni {
  Future<List<Testimoni>> fetchTestimoni() async {
    var url = Uri.parse('http://10.0.2.2:8000/testimoni/get/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    // melakukan konversi data json menjadi object ToDo
    List<Testimoni> listTestimoni = [];
    for (var d in data) {
      if (d != null) {
        listTestimoni.add(Testimoni.fromJson(d));
      }
    }

    return listTestimoni;
  }
}
