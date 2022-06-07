import 'package:flutter/material.dart';
import 'package:pets/src/shared/utils/constants.dart';

class UserInfo extends StatelessWidget {
  final String userPhoto;
  final String username;
  final double imageSize;
  const UserInfo({
    Key? key,
    required this.userPhoto,
    required this.username,
    required this.imageSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: imageSize,
          backgroundImage: NetworkImage(
            userPhoto,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(username, style: textStyle),
        ),
      ],
    );
  }
}
