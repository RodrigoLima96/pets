import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pets/src/modules/profile/settings/edit_profile/controllers/edit_user_controller.dart';
import 'package:pets/src/shared/utils/constants.dart';
import 'package:provider/provider.dart';

class UserPhoto extends StatefulWidget {
  const UserPhoto({
    Key? key,
    required this.photoUrl,
  }) : super(key: key);

  final String photoUrl;

  @override
  State<UserPhoto> createState() => _UserPhotoState();
}

class _UserPhotoState extends State<UserPhoto> {
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<EditUserController>();

    return Stack(
      children: [
        controller.image == null
            ? CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                  widget.photoUrl,
                ),
              )
            : CircleAvatar(
                radius: 60,
                backgroundImage: MemoryImage(controller.image!),
              ),
        Positioned(
          bottom: -15,
          child: IconButton(
            onPressed: () {
              controller.addImage();
            },
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
