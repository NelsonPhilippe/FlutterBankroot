import 'package:flutter/material.dart';
import 'package:learning/components/appbar.dart';

import '../extensions/hex_color.dart';

class LoginPage extends StatefulWidget{
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginStatePage();
}

class _LoginStatePage extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDisconnect.appBar(),
      body: SizedBox(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(233, 233, 233, 57.7),
                          Color.fromRGBO(45, 45, 45, 100)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter
                    )
                )
            ),
            Center(
              child: Container(
                width: 350,
                height: 400,
                color: HexaColor.fromHex("071A2E"),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                      child: TextFormField(
                        cursorColor: Colors.white,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: HexaColor.fromHex("#C0C0C0"),
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.mail,
                            color: HexaColor.fromHex("071A2E"),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)
                          ),
                          labelText: 'Enter your email',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                      child: TextFormField(
                        cursorColor: Colors.white,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: HexaColor.fromHex("#C0C0C0"),
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.key,
                            color: HexaColor.fromHex("071A2E"),
                          ),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)
                          ),
                          labelText: 'Enter your password',
                        ),
                      ),
                    )
                  ],
                )
              )
            )
          ],
        ),
      )
    );
  }

}