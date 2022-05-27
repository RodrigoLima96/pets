import 'package:flutter/material.dart';
import 'package:pets/src/modules/profile/widgets/profile_body.dart';
import 'package:pets/src/shared/utils/constants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kBlack,
      body: ProfileBody(),
    );
  }
}
