import 'package:flutter/material.dart';
import 'package:pets/src/shared/utils/constants.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.1),
      child: TextButton(
          onPressed: () {},
          child: Text('Logout',
              style: textStyle.copyWith(color: Colors.red[400]))),
    );
  }
}
