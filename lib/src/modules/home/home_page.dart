import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pets/src/modules/auth/welcome/welcome_page.dart';
import 'package:pets/src/shared/utils/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      body: Center(
        child: TextButton(
          child: const Text(
            'Sign out',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {
            FirebaseAuth.instance.signOut();
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const WelcomePage(),
                ),
                (Route<dynamic> route) => false);
          },
        ),
      ),
    );
  }
}
