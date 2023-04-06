import 'dart:convert';
import 'package:http/http.dart' as http;

class UserHttpService {
  
  static Future<http.Response> login(String username, String password) async {
    return await http.post(
      Uri.parse('http://152.228.163.78:3000/auth/login'),
      headers: <String, String>{
        'Content-Type' : 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'mail': username,
        'password': password
      }),
    );
  }


}