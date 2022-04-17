import 'package:flutter/material.dart';
import 'package:pets/src/shared/utils/constants.dart';
import 'package:pets/src/shared/widgets/text_field_container.dart';

class RoundedInputText extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget icon;
  final FormFieldValidator<String> validator;

  const RoundedInputText({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.controller,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        validator: validator,
        controller: controller,
        style: const TextStyle(color: kBlack),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: kBlack),
          icon: icon,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
