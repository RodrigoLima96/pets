import 'package:flutter/material.dart';
import 'package:pets/constants.dart';
import 'package:pets/pages/signup/widgets/body.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      appBar: AppBar(
        backgroundColor: kBlack,
      ),
      body: const Body(),
    );
  }
}
