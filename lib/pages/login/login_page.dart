import 'package:flutter/material.dart';
import 'package:pets/constants.dart';
import 'package:pets/pages/login/widgets/body.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kBlack,
      body: Body(),
    );
  }
}
