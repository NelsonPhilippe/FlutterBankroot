import 'package:flutter/material.dart';

import './extensions/hex_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class SignButton extends StatelessWidget {

  final String text;
  final String redirect;
  final Color? color;

  const SignButton({super.key, required this.text, required this.redirect, this.color});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(color!),
          alignment: Alignment.center,
          fixedSize: MaterialStateProperty.all(Size(150, 40))
      ),
      onPressed: () {
        print('test');
      },
      child: Text(text, style: TextStyle(fontSize: 15.0, color: Colors.white)),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('resources/img/logo.png', width: 80, height: 80),
        backgroundColor: HexaColor.fromHex("071A2E"),
        toolbarHeight: 100,
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              Container(
                margin: const EdgeInsets.all(15.0),
                child:  SignButton(
                  text: 'Signing',
                  redirect: 'signing',
                  color: HexaColor.fromHex("21529E"),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(15.0),
                child:  SignButton(
                  text: 'Signup',
                  redirect: 'signup',
                  color: HexaColor.fromHex('#634597'),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child:  Image.asset(''),
                )
              )
            ]
        ),
      ),
    );
  }
}
