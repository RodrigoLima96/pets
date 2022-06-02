import 'package:flutter/material.dart';
import 'package:pets/src/modules/auth/pages/signup/widgets/sign_up_body.dart';
import 'package:pets/src/shared/utils/constants.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      appBar: AppBar(
        backgroundColor: kBlack,
      ),
      body: const SignUpBody(),
    );
  }
}
