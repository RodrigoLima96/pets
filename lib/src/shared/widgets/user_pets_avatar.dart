import 'package:flutter/material.dart';
import 'package:pets/src/shared/utils/constants.dart';

class UserPetsAvatar extends StatelessWidget {
  final String petPhoto;
  final String petName;
  final double imageRadius;
  const UserPetsAvatar({
    Key? key,
    required this.petPhoto,
    required this.petName,
    required this.imageRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          CircleAvatar(
            radius: imageRadius,
            backgroundImage: NetworkImage(
              petPhoto,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(petName, style: textStyle),
          ),
        ],
      ),
    );
  }
}
