import 'dart:convert';

class APIResponse {
  int status;
  bool isSucceed;
  String responseKey;
  String message;
  List<dynamic> errors;
  String data;

  APIResponse.fromJson(Map jsons)
      : status = jsons["status"],
        isSucceed = jsons["isSucceed"],
        responseKey = jsons["responseKey"],
        message = jsons["message"],
        errors = jsons["errors"],
        data = json.encode(jsons["data"]);

}
