import 'package:flutter/material.dart';
import 'package:pets/src/modules/profile/pages/settings/edit_profile/edit_profile_page.dart';
import 'package:pets/src/models/user.dart' as model;
import 'package:pets/src/modules/profile/pages/settings/settings/widgets/logout_button.dart';
import 'package:pets/src/modules/profile/pages/settings/settings/widgets/setting_option.dart';

class SettingsBody extends StatelessWidget {
  final model.User user;
  const SettingsBody({Key? key, required this.user}) : super(key: key);

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
            function: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => EditProfilePage(user: user)));
            },
          ),
          SettingOption(
            size: size,
            text: 'Edit Pets',
            icon: 'assets/icons/pet.svg',
            function: () {},
          ),
          LogoutButton(size: size),
        ],
      ),
    );
  }
}
