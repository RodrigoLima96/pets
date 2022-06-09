import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pets/src/models/pet.dart';
import 'package:pets/src/models/user.dart' as model;
import 'package:pets/src/modules/profile/pages/settings/settings/settings_page.dart';
import 'package:pets/src/shared/utils/constants.dart';

class Settings extends StatelessWidget {
  final model.User user;
  final List<Pet> pets;
  final int notifications;

  const Settings({
    Key? key,
    required this.user,
    required this.pets,
    required this.notifications,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      padding: const EdgeInsets.only(right: kDefaultPadding),
      child: Column(
        children: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SettingsPage(user: user, pets: pets)));
            },
            icon: SvgPicture.asset(
              'assets/icons/setting.svg',
              color: kPrimaryColor,
              height: 20,
            ),
          ),
        ],
      ),
    );
  }
}
