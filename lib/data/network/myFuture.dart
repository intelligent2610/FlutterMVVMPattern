import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:share_your_christmas/utils/stringUtil.dart';
import 'apiEndPoint.dart';
import 'dataUtils.dart';
import 'package:share_your_christmas/model/apiResponse.dart';

Future<APIResponse> createLogin(
    String username, String password, bool isRemember) async {
  final response = await http.post(END_POINT_LOGIN,
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: json.encode(getLoginPost(username, password, isRemember)));
  return APIResponse.fromJson(json.decode(response.body));
}

Future<APIResponse> createRegister(
    String username, String email, String password) async {
  final response = await http.post(END_POINT_REGISTER,
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: json.encode(getRegister(username, email, password)));
  return APIResponse.fromJson(json.decode(response.body));
}

Future<APIResponse> getConfig() async {
  final response = await http.get(END_POINT_GET_CONFIG, headers: {
    HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded'
  });
  return APIResponse.fromJson(json.decode(response.body));
}
