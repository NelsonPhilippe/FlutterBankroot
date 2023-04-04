import 'package:flutter/material.dart';
import 'package:learning/components/appbar.dart';

class RegisterPage extends StatefulWidget{
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterStatePage();
}

class _RegisterStatePage extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDisconnect.appBar(),
    );
  }

}