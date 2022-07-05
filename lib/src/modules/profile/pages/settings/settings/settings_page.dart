import 'package:flutter/material.dart';
import 'package:pets/src/modules/profile/pages/settings/settings/widgets/settings_body.dart';
import 'package:pets/src/shared/utils/constants.dart';

class SettingsPage extends StatelessWidget {
  final List<dynamic> userInfo;
  const SettingsPage({Key? key, required this.userInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      appBar: AppBar(
        backgroundColor: kBlack,
      ),
      body: SettingsBody(user: userInfo[0], pets: userInfo[1]),
    );
  }
}
