import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pets/src/models/pet.dart';
import 'package:pets/src/models/user.dart' as model;
import 'package:pets/src/modules/profile/pages/settings/settings/widgets/logout_button.dart';
import 'package:pets/src/modules/profile/pages/settings/settings/widgets/setting_option.dart';
import 'package:pets/src/routes/router_utils.dart';

class SettingsBody extends StatelessWidget {
  final model.User user;
  final List<Pet> pets;
  const SettingsBody({Key? key, required this.user, required this.pets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      padding: EdgeInsets.only(top: size.height * 0.01),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SettingOption(
            size: size,
            text: 'Edit Profile',
            icon: 'assets/icons/person.svg',
            function: () =>
                context.push(AppPage.editProfile.toPath, extra: user),
          ),
          SettingOption(
            size: size,
            text: 'Edit Pets',
            icon: 'assets/icons/pet.svg',
            function: () =>
                context.push(AppPage.editPetList.toPath, extra: pets),
          ),
          LogoutButton(size: size),
        ],
      ),
    );
  }
}
