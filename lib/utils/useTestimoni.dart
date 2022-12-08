// ignore_for_file: file_names

import 'package:trashsure/models/Testimoni.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UseTestimoni {
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

  Future<dynamic> addTestimoni(context, request, desc) async {
    var response =
        await request.post('http://10.0.2.2:8000/flutter/user/testimoni/add/', {
      "desc": desc,
    });

    return response;
  }
}
