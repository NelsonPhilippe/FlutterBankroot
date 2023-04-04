import 'package:flutter/material.dart';
import 'package:learning/views/login.dart';
import 'package:learning/views/home.dart';
import 'package:learning/views/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/' : (context) => const HomePage(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => RegisterPage()
      },
    );
  }
}
