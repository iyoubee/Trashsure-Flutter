// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:shared_preferences/shared_preferences.dart';

class CookieRequest {
  Map<String, String> headers = {};
  Map<String, String> cookies = {};
  Map<String, dynamic> jsonData = {};
  final http.Client _client = http.Client();

  late SharedPreferences local;

  bool loggedIn = false;
  bool initialized = false;

  Future init() async {
    if (!initialized) {
      local = await SharedPreferences.getInstance();
      String? savedCookies = local.getString("cookies");
      if (savedCookies != null) {
        cookies = Map<String, String>.from(json.decode(savedCookies));
        if (cookies['sessionid'] != null) {
          loggedIn = true;
          headers['cookie'] = _generateCookieHeader();
        }
      }
    }
    initialized = true;
  }

  Future persist(String cookies) async {
    local.setString("cookies", cookies);
  }

  Future<dynamic> login(dynamic data) async {
    String url = "http://192.168.56.1:8000/api/login";
    if (kIsWeb) {
      dynamic c = _client;
      c.withCredentials = true;
    }

    http.Response response =
        await _client.post(Uri.parse(url), body: data, headers: headers);

    await _updateCookie(response);

    if (response.statusCode == 200) {
      loggedIn = true;
      jsonData = json.decode(response.body);
    } else {
      loggedIn = false;
    }

    // Expects and returns JSON request body
    return json.decode(response.body);
  }

  Future<dynamic> register(dynamic data) async {
    String url = "http://192.168.56.1:8000/api/register";
    if (kIsWeb) {
      dynamic c = _client;
      c.withCredentials = true;
    }

    http.Response response =
        await _client.post(Uri.parse(url), body: data, headers: headers);

    if (response.statusCode == 200) {
      http.Response response = await login(data);
      return json.decode(response.body);
    } else {
      return json.decode(response.body);
    }
  }

  Map<String, dynamic> getJsonData() {
    return jsonData;
  }

  Future<dynamic> get(String url) async {
    if (kIsWeb) {
      dynamic c = _client;
      c.withCredentials = true;
    }
    http.Response response =
        await _client.get(Uri.parse(url), headers: headers);
    _updateCookie(response);
    // Expects and returns JSON request body
    return jsonDecode(utf8.decode(response.bodyBytes));
  }

  Future<dynamic> post(String url, dynamic data) async {
    if (kIsWeb) {
      dynamic c = _client;
      c.withCredentials = true;
    }
    http.Response response =
        await _client.post(Uri.parse(url), body: data, headers: headers);
    // Expects and returns JSON request body
    return jsonDecode(utf8.decode(response.bodyBytes));
  }

  Future<dynamic> postJson(String url, dynamic data) async {
    if (kIsWeb) {
      dynamic c = _client;
      c.withCredentials = true;
    }
    // Add additional header
    headers['Content-Type'] = 'application/json; charset=UTF-8';
    http.Response response =
        await _client.post(Uri.parse(url), body: data, headers: headers);
    // Remove used additional header
    headers.remove('Content-Type');
    _updateCookie(response);
    return json.decode(response.body); // Expects and returns JSON request body
  }

  Future _updateCookie(http.Response response) async {
    // Solves LateInitializationError
    await init();

    String? allSetCookie = response.headers['set-cookie'];

    if (allSetCookie != null) {
      var setCookies = allSetCookie.split(',');

      for (var setCookie in setCookies) {
        var cookies = setCookie.split(';');

        for (var cookie in cookies) {
          _setCookie(cookie);
        }
      }

      headers['cookie'] = _generateCookieHeader();
      String cookieObject = (const JsonEncoder()).convert(cookies);
      persist(cookieObject);
    }
  }

  void _setCookie(String rawCookie) {
    if (rawCookie.isNotEmpty) {
      var keyValue = rawCookie.split('=');
      if (keyValue.length == 2) {
        var key = keyValue[0].trim();
        var value = keyValue[1];

        // ignore keys that aren't cookies
        if (key == 'path' || key == 'expires') return;

        cookies[key] = value;
      }
    }
  }

  String _generateCookieHeader() {
    String cookie = "";

    for (var key in cookies.keys) {
      if (cookie.isNotEmpty) cookie += ";";
      String? newCookie = cookies[key];
      cookie += '$key=$newCookie';
    }

    return cookie;
  }

  Future<dynamic> logout(String url) async {
    http.Response response = await _client.post(Uri.parse(url));

    if (response.statusCode == 200) {
      await _updateCookie(response);
      local = await SharedPreferences.getInstance();
      local.remove("cookies");

      loggedIn = false;
      jsonData = {};
    } else {
      loggedIn = true;
    }

    cookies = {};

    return json.decode(response.body);
  }
}
