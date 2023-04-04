
import 'package:flutter/material.dart';
import '../extensions/hex_color.dart';

class AppBarDisconnect {
  static AppBar appBar() {
    return AppBar(
      title: Image.asset('resources/img/logo.png', width: 80, height: 80),
      backgroundColor: HexaColor.fromHex("071A2E"),
      toolbarHeight: 100,
    );
  }
}