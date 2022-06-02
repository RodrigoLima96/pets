import 'package:flutter/material.dart';
import 'package:pets/src/modules/profile/pages/profile/widgets/profile_body.dart';
import 'package:pets/src/shared/utils/constants.dart';

class ProfilePage extends StatelessWidget {
  final String uid;

  const ProfilePage({Key? key, required this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      body: ProfileBody(uid: uid),
    );
  }
}
