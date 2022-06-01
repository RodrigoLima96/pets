import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pets/src/modules/profile/notifications/notifications_page.dart';
import 'package:pets/src/modules/profile/settings/settings/settings_page.dart';
import 'package:pets/src/shared/models/user.dart' as model;
import 'package:pets/src/shared/utils/constants.dart';

class SettingsAndNotifications extends StatelessWidget {
  final model.User user;
  final int notifications;

  const SettingsAndNotifications({
    Key? key,
    required this.notifications,
    required this.user,
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
                      builder: (context) => SettingsPage(user: user)));
            },
            icon: SvgPicture.asset(
              'assets/icons/setting.svg',
              color: kPrimaryColor,
              height: 20,
            ),
          ),
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NotificationsPage()));
                },
                icon: SvgPicture.asset(
                  'assets/icons/notification.svg',
                  color: kPrimaryColor,
                  height: 30,
                ),
              ),
              notifications > 0
                  ? Padding(
                      padding: const EdgeInsets.only(
                        top: kDefaultPadding,
                        left: kDefaultPadding * 2,
                      ),
                      child: Text(
                        notifications.toString(),
                        style: textStyle.copyWith(
                            color: Colors.redAccent, fontSize: 18),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ],
      ),
    );
  }
}
