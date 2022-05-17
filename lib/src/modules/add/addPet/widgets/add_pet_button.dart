import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pets/src/modules/add/controllers/add_controller.dart';
import 'package:pets/src/shared/utils/constants.dart';
import 'package:pets/src/shared/utils/methods.dart';
import 'package:pets/src/shared/widgets/rounded_button.dart';
import 'package:provider/provider.dart';

class AddPetButton extends StatelessWidget {
  final Size size;
  final Uint8List image;
  final TextEditingController nameController;
  final TextEditingController typeController;
  final TextEditingController genderController;
  final TextEditingController weightController;
  final TextEditingController ageController;

  const AddPetButton({
    Key? key,
    required this.size,
    required this.image,
    required this.nameController,
    required this.typeController,
    required this.genderController,
    required this.weightController,
    required this.ageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AddController>();

    return controller.state == AddPetState.loading
        ? SizedBox(
            height: size.height * 0.09,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          )
        : RoundedButton(
            text: 'ADD',
            press: () async {
              await controller.addPet(
                image,
                nameController.text,
                typeController.text,
                genderController.text,
                double.parse(weightController.text),
                int.parse(ageController.text),
              );
              showTopSnackBar(context, 'Pet Adicionado!', false);
              context.pop();
            },
            color: kPrimaryColor,
            textColor: kWhite,
            size: size,
          );
  }
}
