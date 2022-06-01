import 'package:flutter/material.dart';
import 'package:pets/src/modules/profile/settings/edit_profile/widgets/update_user_button.dart';
import 'package:pets/src/modules/profile/settings/edit_profile/widgets/user_name.dart';
import 'package:pets/src/modules/profile/settings/edit_profile/widgets/user_photo.dart';
import 'package:pets/src/shared/models/user.dart' as model;

class EditProfileBody extends StatelessWidget {
  final model.User user;
  const EditProfileBody({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final TextEditingController nameController =
        TextEditingController(text: user.name);
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
            formKey: _formKey,
          ),
          UpdateUserButton(
            size: size,
            uid: user.uid,
            name: nameController,
            formKey: _formKey,
          ),
        ],
      ),
    );
  }
}
