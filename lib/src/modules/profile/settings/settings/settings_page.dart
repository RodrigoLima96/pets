import 'package:flutter/material.dart';
import 'package:pets/src/modules/profile/settings/settings/widgets/settings_body.dart';
import 'package:pets/src/shared/models/user.dart' as model;
import 'package:pets/src/shared/utils/constants.dart';

class SettingsPage extends StatelessWidget {
  final model.User user;
  const SettingsPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      appBar: AppBar(
        backgroundColor: kBlack,
      ),
      body: SettingsBody(user: user),
    );
  }
}
