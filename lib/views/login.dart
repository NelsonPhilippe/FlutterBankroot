import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:learning/components/appbar.dart';
import 'package:learning/components/loading_dialog.dart';
import 'package:learning/http/user_http.dart';
import 'package:http/http.dart' as http;
import 'package:learning/services/auth_service.dart';
import 'package:learning/storage.dart';
import 'package:learning/views/user.dart';

import '../extensions/hex_color.dart';

class LoginPage extends StatefulWidget{
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginStatePage();
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm>{

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<State> _LoaderDialog = GlobalKey<State>();

  TextEditingController mail = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
            child: TextFormField(
              controller: mail,
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
              validator: (value) {
                if(value == null || value.isEmpty) {
                  return 'This input cannot empty';
                }

                RegExp exp = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
                String? match = exp.stringMatch(value);

                if(match == null || match.isEmpty) {
                  return "Invalide mail";
                }
              },
            ),

          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
            child: TextFormField(
              controller: password,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
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
              validator: (value) {
                if(value == null || value.isEmpty) {
                  return 'Password cannot be empty';
                }
              },
            ),
          ),
            TextButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                alignment: Alignment.center,
                fixedSize: MaterialStateProperty.all(const Size(200, 40))
              ),
              onPressed: () async {
                if(_formKey.currentState!.validate()) {
                  LoadingDialog.showLoadingDialog(context, _LoaderDialog);

                  try {
                    http.Response login = await UserHttpService.login(mail.text, password.text);

                    if (!context.mounted) return;

                    print(login.statusCode);


                    if(login.statusCode == 404) {
                      Navigator.of(_LoaderDialog.currentContext!, rootNavigator: true).pop();

                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Error: server connexion timeout', style: TextStyle(color: Colors.red),))
                      );
                    }

                    if(login.statusCode == 500) {
                      Navigator.of(_LoaderDialog.currentContext!, rootNavigator: true).pop();

                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Error: server connexion timeout', style: TextStyle(color: Colors.red),))
                      );
                    }

                    if(login.statusCode == 201) {
                      Map<String, dynamic> body = jsonDecode(login.body);
                      AuthService.getInstance()?.login(body['access_token']);
                      Navigator.of(_LoaderDialog.currentContext!, rootNavigator: true).pop();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => const UserPage()));
                    }
                  }catch(error) {
                    throw Exception('Server connexion refused');
                  }

                }
              },
              child: const Text('Connect', style: TextStyle(fontSize: 15.0, color: Colors.white)),
            )
        ],
      )
    );
  }

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
              child: SizedBox(
                width: 350,
                height: 400,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget> [
                    LoginForm()
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