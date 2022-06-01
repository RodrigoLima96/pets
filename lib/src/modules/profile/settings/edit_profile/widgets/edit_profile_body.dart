import 'package:flutter/material.dart';
import 'package:pets/src/modules/profile/settings/edit_profile/widgets/user_name.dart';
import 'package:pets/src/modules/profile/settings/edit_profile/widgets/user_photo.dart';
import 'package:pets/src/shared/models/user.dart' as model;
import 'package:pets/src/shared/utils/constants.dart';
import 'package:pets/src/shared/widgets/rounded_button.dart';

class EditProfileBody extends StatelessWidget {
  const EditProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final TextEditingController nameController = TextEditingController();
    final model.User user = model.User(
      uid: 'uid',
      name: 'Rodrigo Lima',
      email: 'email',
      rating: 9.2,
      photoUrl:
          'https://lh3.googleusercontent.com/a-/AOh14Gg0MIEyf9UUz1SVZ90cerGjaISKr8ktcMPCORv-WA=s288-p-rw-no',
    );
    return Container(
      height: size.height,
      width: double.infinity,
      padding: EdgeInsets.only(top: size.height * 0.1),
      child: Column(
        children: [
          UserPhoto(photoUrl: user.photoUrl!),
          UserName(
            size: size,
            nameController: nameController,
            username: user.name,
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.1),
            child: RoundedButton(
              text: 'UPDATE',
              press: () {},
              color: kPrimaryColor,
              textColor: kWhite,
              size: size,
            ),
          ),
        ],
      ),
    );
  }
}
