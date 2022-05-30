import 'package:flutter/material.dart';
import 'package:pets/src/shared/utils/constants.dart';

class UserInfo extends StatelessWidget {
  final String userPhoto;
  final String username;
  final double rating;
  final double imageSize;
  const UserInfo({
    Key? key,
    required this.userPhoto,
    required this.username,
    required this.rating,
    required this.imageSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Column(
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
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 3),
                  child: Icon(
                    Icons.star,
                    color: Colors.amber.shade400,
                    size: 20,
                  ),
                ),
                Text(
                  '${rating.toString()}/10',
                  style: textStyle.copyWith(
                    letterSpacing: -0.7,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
