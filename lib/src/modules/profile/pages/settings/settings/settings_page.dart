import 'package:flutter/material.dart';
import 'package:pets/src/models/pet.dart';
import 'package:pets/src/models/user.dart' as model;
import 'package:pets/src/modules/profile/pages/settings/settings/widgets/settings_body.dart';
import 'package:pets/src/shared/utils/constants.dart';

class SettingsPage extends StatelessWidget {
  final model.User user;
  final List<Pet> pets;
  const SettingsPage({Key? key, required this.user, required this.pets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      appBar: AppBar(
        backgroundColor: kBlack,
      ),
      body: SettingsBody(user: user, pets: pets),
    );
  }
}
