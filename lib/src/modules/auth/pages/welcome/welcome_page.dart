import 'package:flutter/material.dart';
import 'package:pets/src/modules/auth/pages/welcome/widgets/welcome_body.dart';
import 'package:pets/src/shared/utils/constants.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kBlack,
      body: WelcomeBody(),
    );
  }
}
