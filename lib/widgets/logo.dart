import 'package:flutter/material.dart';
import 'package:pets/constants.dart';

class Logo extends StatelessWidget {
  final bool login;
  final Size size;
  const Logo({Key? key, required this.login, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/logo.png',
          width: size.width * 0.2,
        ),
        SizedBox(height: size.height * 0.02),
        Text(
          login ? 'LOGIN' : 'SIGN UP',
          style: const TextStyle(
            color: kWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
