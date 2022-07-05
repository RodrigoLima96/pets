import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pets/src/models/pet.dart';
import 'package:pets/src/models/user.dart' as model;
import 'package:pets/src/routes/router_utils.dart';
import 'package:pets/src/shared/utils/constants.dart';

class Settings extends StatelessWidget {
  final model.User user;
  final List<Pet> pets;

  const Settings({
    Key? key,
    required this.user,
    required this.pets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      padding: const EdgeInsets.only(right: kDefaultPadding),
      child: Column(
        children: [
          IconButton(
            onPressed: () =>
                context.push(AppPage.settings.toPath, extra: [user, pets]),
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
