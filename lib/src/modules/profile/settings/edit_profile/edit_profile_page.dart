import 'package:flutter/material.dart';
import 'package:pets/src/modules/profile/settings/edit_profile/widgets/edit_profile_body.dart';
import 'package:pets/src/shared/utils/constants.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      appBar: AppBar(
        backgroundColor: kBlack,
      ),
      body: const EditProfileBody(),
    );
  }
}
