import 'package:flutter/material.dart';
import 'package:pets/src/shared/utils/constants.dart';
import 'package:pets/src/modules/auth/login/widgets/login_body.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kBlack,
      body: LoginBody(),
    );
  }
}
