import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// API URL
// const String baseUrl = "http://10.0.2.2:8000/api";
const String baseUrl = "https://9adc-111-223-178-75.ngrok-free.app/api";
// Headers
const Map<String, String> headers = {"Content-Type": "Application/json"};



getSavedToken() async {
  SharedPreferences storage = await SharedPreferences.getInstance();
  String? token = storage.getString('JWT');
  return token;
}

getSavedName() async {
  SharedPreferences storage = await SharedPreferences.getInstance();
  String? name = storage.getString('UNAME');
  return name;
}

saveTheToken(String token) async {
  SharedPreferences storage = await SharedPreferences.getInstance();
  storage.setString('JWT', token);
}

saveUserId(String id) async {
  SharedPreferences storage = await SharedPreferences.getInstance();
  storage.setString('UID', id);
}
saveUserName(String name) async {
  SharedPreferences storage = await SharedPreferences.getInstance();
  storage.setString('UNAME', name);
}
saveUserType(String type) async {
  SharedPreferences storage = await SharedPreferences.getInstance();
  storage.setString('UTYPE', type);
}