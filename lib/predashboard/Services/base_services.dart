import 'dart:convert';
import 'dart:developer';


import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BaseService {
  Future<String?> getStoredCSRFToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('csrfToken');
  }


  Future getHttp(String api) async {
    final url = api;
    log(url, name: 'getHttp');

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'content-type': 'application/json',
        'Host': 'suraj.ojha20145@gmail.com',
      },
    );

    return response;
  }
  Future<http.Response> postHttp({required String api, required Map<String, dynamic> data,})
  async {
    final url = api;
    log(url, name: 'postHttp');
    final body = json.encode(data);

    final csrfToken = await getStoredCSRFToken();
    print(csrfToken);
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Cookie': csrfToken.toString(),
        'X-CSRFToken': csrfToken.toString(),
      },
      body: utf8.encode(body),
    );

    return response;
  }

}
