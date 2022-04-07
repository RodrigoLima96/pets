import 'package:flutter/material.dart';
import 'package:pets/pages/welcome/widgets/body.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Body(),
    );
  }
}
