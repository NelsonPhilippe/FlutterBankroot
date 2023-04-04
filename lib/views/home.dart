
import 'package:flutter/material.dart';
import 'package:learning/components/appbar.dart';
import '../extensions/hex_color.dart';

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
          fixedSize: MaterialStateProperty.all(Size(200, 40))
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/$redirect');
      },
      child: Text(text, style: TextStyle(fontSize: 15.0, color: Colors.white)),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget> [
                    Container(
                      margin: const EdgeInsets.fromLTRB(200.0, 15.0, 15.0, 15.0),
                      child:  SignButton(
                        text: 'Signing',
                        redirect: 'login',
                        color: HexaColor.fromHex("21529E"),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(200.0, 15.0, 15.0, 15.0),
                      child:  SignButton(
                        text: 'Signup',
                        redirect: 'signup',
                        color: HexaColor.fromHex('#634597'),
                      ),
                    ),

                  ]
              ),
              Positioned(
                bottom: 0,
                right: 0,
                height: 500,
                width: 500,
                child: Image.asset('resources/img/bg_home.png', fit: BoxFit.fill),
              )
            ]
        ),
      ),
    );
  }
}
