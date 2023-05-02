import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:provider_rest_api/model/get_model.dart';
import 'package:http/http.dart' as http;
import '../model/signUp_model.dart';

Future<GetModel?> getPostData() async {
  GetModel? result;
  try {
    final response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/posts/2"),
        headers: {HttpHeaders.contentTypeHeader: "application/json"});
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      result = GetModel.fromJson(item);
    } else {
     log(response.toString());
    }
  } catch (e) {
     log(e.toString());
  }
  return result;
}

Future<http.Response?> register(SignUpBody body) async {
  http.Response? response;
  try {
    response = await http.post(
        Uri.parse("http://127.0.0.1:8000/api/v1/auth/register"),
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
        body: jsonEncode(body.toJson()));
        log(response.toString());
  } catch (e) {
    log(e.toString());
  }
  return response;
}
