import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:learning/storage.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  int? priority = 0;

  AuthMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {

    String? accessToken = Storage.getString('access_token');
    print(accessToken);

    if(accessToken == null || accessToken.isEmpty) {
      return const RouteSettings(name: '/');
    }

    return const RouteSettings(name: '/user');
  }

  @override
  Widget onPageBuilt(Widget page) {
    print('Widget ${page.toStringShort()} will be showed');
    return page;
  }

  @override
  void onPageDispose() {
    print('PageDisposed');
  }
}