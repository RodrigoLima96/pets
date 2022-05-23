import 'package:flutter/material.dart';
import 'package:pets/src/shared/utils/constants.dart';
import 'package:pets/src/shared/widgets/rounded_button.dart';

class AddPostButton extends StatelessWidget {
  const AddPostButton({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
      text: 'POST',
      press: () {},
      color: kPrimaryColor,
      textColor: kWhite,
      size: size,
    );
  }
}
