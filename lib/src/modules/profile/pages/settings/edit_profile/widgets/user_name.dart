import 'package:flutter/material.dart';
import 'package:pets/src/shared/utils/constants.dart';
import 'package:pets/src/shared/widgets/input_text.dart';

class UserName extends StatelessWidget {
  final Size size;
  final TextEditingController nameController;
  final String username;
  final GlobalKey<FormState> formKey;

  const UserName({
    Key? key,
    required this.size,
    required this.nameController,
    required this.username,
    required this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 2),
      padding: EdgeInsets.only(top: size.height * 0.03),
      child: Form(
        key: formKey,
        child: InputText(
          controller: nameController,
          hintText: 'name',
          validator: (value) => null,
          keyboardType: TextInputType.text,
        ),
      ),
    );
  }
}
