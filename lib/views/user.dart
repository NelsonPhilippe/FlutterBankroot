
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning/components/appbar.dart';
import 'package:learning/extensions/hex_color.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();

}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarConnected.appBar(),
      body: Stack(
        children: [
          Positioned(
              top: 0,
              width: context.width,
              child: SizedBox(
                height: 400,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(40),
                        child: const Solde(),
                      ),
                      const Center(
                        child: Solde(),
                      )
                    ],
                )
              )
          ),
          SizedBox(
            height: 400,
            child: ClipPath(
              clipper: GreenClipper(),
              child: Container(
                color: HexaColor.fromHex('2E2E2E'),
              ),
            ),
          ),
        ],
      )
    );
  }
}

class Solde extends StatelessWidget {
  const Solde({super.key});

  List<Widget> desktop() {
    return [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: HexaColor.fromHex('D9D9D9'),
        ),
        width: 100,
        height: 50,
        child: const Text('0', style: TextStyle(fontSize: 30), textAlign: TextAlign.center),
      ),
      Container(
        width: 70,
        height: 50,
        color: HexaColor.fromHex('071A2E'),
        child: const Text('\$', style: TextStyle(color: Colors.white, fontSize: 30), textAlign: TextAlign.center),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...desktop()
      ],
    );
  }

}

class GreenClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height / 4.25);
    var firstControlPoint = Offset(size.width / 4, size.height / 3);
    var firstEndPoint = Offset(size.width / 2, size.height / 3 - 60);
    var secondControlPoint =
    Offset(size.width - (size.width / 4), size.height / 4 - 65);
    var secondEndPoint = Offset(size.width, size.height / 3 - 40);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height / 3);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}