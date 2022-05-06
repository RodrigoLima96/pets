import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pets/src/routes/router_utils.dart';
import 'package:pets/src/shared/utils/constants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      body: Center(
        child: TextButton(
          onPressed: () {
            FirebaseAuth.instance.signOut();
            context.goNamed(AppPage.welcome.toName);
          },
          child: const Text('SAIR'),
        ),
      ),
    );
  }
}
