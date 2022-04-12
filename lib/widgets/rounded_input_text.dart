import 'package:flutter/material.dart';
import 'package:pets/constants.dart';
import 'package:pets/widgets/text_field_container.dart';

class RoundedInputText extends StatelessWidget {
  final String hintText;
  final Widget icon;
  const RoundedInputText({
    Key? key,
    required this.hintText,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
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
