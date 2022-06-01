import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pets/src/shared/utils/constants.dart';

class UserPhoto extends StatelessWidget {
  const UserPhoto({
    Key? key,
    required this.photoUrl,
  }) : super(key: key);

  final String photoUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 60,
          backgroundImage: NetworkImage(
            photoUrl,
          ),
        ),
        Positioned(
          bottom: -15,
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/edit.svg',
              color: kPrimaryColor,
              width: 30,
            ),
          ),
        )
      ],
    );
  }
}
