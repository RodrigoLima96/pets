import 'package:flutter/material.dart';
import 'package:pets/src/shared/utils/constants.dart';
import 'package:pets/src/shared/widgets/input_text.dart';

class UserName extends StatelessWidget {
  const UserName({
    Key? key,
    required this.size,
    required this.nameController,
    required this.username,
  }) : super(key: key);

  final Size size;
  final TextEditingController nameController;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 2),
      padding: EdgeInsets.only(top: size.height * 0.03),
      child: Form(
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
