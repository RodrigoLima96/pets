import 'package:flutter/material.dart';
import 'package:pets/src/shared/models/pet.dart';
import 'package:pets/src/shared/utils/constants.dart';
import 'package:pets/src/shared/widgets/rounded_button.dart';

class AddPostButton extends StatelessWidget {
  final List<Pet> pets;
  final GlobalKey<FormState> formKey;

  const AddPostButton({
    Key? key,
    required this.size,
    required this.formKey,
    required this.pets,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
      text: 'POST',
      press: () {
        if (formKey.currentState!.validate()) {
          print('deu bom');
        }
      },
      color: kPrimaryColor,
      textColor: kWhite,
      size: size,
    );
  }
}
