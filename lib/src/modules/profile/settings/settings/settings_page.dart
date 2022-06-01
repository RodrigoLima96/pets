import 'package:flutter/material.dart';
import 'package:pets/src/modules/profile/settings/settings/widgets/settings_body.dart';
import 'package:pets/src/shared/utils/constants.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      appBar: AppBar(
        backgroundColor: kBlack,
      ),
      body: const SettingsBody(),
    );
  }
}
