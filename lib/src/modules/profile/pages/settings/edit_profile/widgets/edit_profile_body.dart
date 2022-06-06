import 'package:flutter/material.dart';
import 'package:pets/src/models/user.dart' as model;
import 'package:pets/src/modules/profile/pages/settings/edit_profile/widgets/update_user_button.dart';
import 'package:pets/src/modules/profile/pages/settings/edit_profile/widgets/user_name.dart';
import 'package:pets/src/modules/profile/pages/settings/edit_profile/widgets/user_photo.dart';

class EditProfileBody extends StatefulWidget {
  final model.User user;
  const EditProfileBody({Key? key, required this.user}) : super(key: key);

  @override
  State<EditProfileBody> createState() => _EditProfileBodyState();
}

class _EditProfileBodyState extends State<EditProfileBody> {
  late final TextEditingController nameController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.user.name);
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: double.infinity,
      padding: EdgeInsets.only(top: size.height * 0.1),
      child: Column(
        children: [
          UserPhoto(photoUrl: widget.user.photoUrl!),
          UserName(
            size: size,
            nameController: nameController,
            username: widget.user.name,
            formKey: _formKey,
          ),
          UpdateUserButton(
            size: size,
            uid: widget.user.uid,
            name: nameController,
            formKey: _formKey,
          ),
        ],
      ),
    );
  }
}
