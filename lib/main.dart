import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning/views/login.dart';
import 'package:learning/views/home.dart';
import 'package:learning/views/register.dart';
import 'package:learning/views/user.dart';

import 'middleware/auth_middleware.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const HomePage(),
        ),
        GetPage(
            name: '/login',
            page: () => LoginPage(),
        ),
        GetPage(
            name: '/signup',
            page: () => LoginPage(),
        ),
        GetPage(
            name: '/user',
            page: () => UserPage(),
            middlewares: [AuthMiddleware(priority: 1)]
        )
      ],
    );
  }
}
