
import 'dart:convert';

import '../storage.dart';

class AuthService {

  static AuthService? _instance;
  bool isLogged = false;

  AuthService() {
    _instance = this;
  }

  void login(String token) {
    Storage.setString('access_token', token);
    isLogged = true;
  }

  void logout() {
    Storage.deleteString('access_token');
    isLogged = false;
  }

  bool isLoggedIn() {
    _refreshInstance();
    return isLogged;
  }

  void _refreshInstance() {
    isLogged = Storage.getString('access_token') == null;
  }

  String? getToken() {
    return isLogged ? Storage.getString('access_token') : null;
  }

  static AuthService? getInstance() {
    return AuthService._instance;
  }

}