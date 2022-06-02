import 'package:flutter/material.dart';
import 'package:pets/src/models/user.dart';
import 'package:pets/src/shared/widgets/user_info.dart';

class ProfileUserInfo extends StatelessWidget {
  final User user;
  const ProfileUserInfo({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserInfo(
      userPhoto: user.photoUrl!,
      username: user.name,
      rating: user.rating,
      imageSize: 60,
    );
  }
}
