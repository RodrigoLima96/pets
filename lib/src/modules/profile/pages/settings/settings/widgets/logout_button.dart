import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pets/src/modules/profile/controllers/logout_controller.dart';
import 'package:pets/src/routes/router_utils.dart';
import 'package:pets/src/shared/utils/constants.dart';
import 'package:provider/provider.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    var controller = context.read<LogoutController>();
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.1),
      child: TextButton(
          onPressed: () {
            controller.logout();
            context.goNamed(AppPage.welcome.toName);
          },
          child: Text('Logout',
              style: textStyle.copyWith(color: Colors.red[400]))),
    );
  }
}
