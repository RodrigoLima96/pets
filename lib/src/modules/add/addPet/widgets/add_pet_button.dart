import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pets/src/modules/add/addPet/controllers/add_pet_controller.dart';
import 'package:pets/src/shared/utils/constants.dart';
import 'package:pets/src/shared/widgets/rounded_button.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AddPetButton extends StatelessWidget {
  final Size size;
  final Uint8List image;
  final TextEditingController nameController;
  final TextEditingController typeController;
  final TextEditingController genderController;
  final TextEditingController weightController;
  final TextEditingController ageController;
  final GlobalKey<FormState> formKey;

  const AddPetButton({
    Key? key,
    required this.size,
    required this.image,
    required this.nameController,
    required this.typeController,
    required this.genderController,
    required this.weightController,
    required this.ageController,
    required this.formKey,
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
              if (formKey.currentState!.validate()) {
                await controller.addPet(
                  image,
                  nameController.text,
                  typeController.text,
                  genderController.text,
                  double.parse(weightController.text),
                  int.parse(ageController.text),
                );
                showTopSnackBar(
                  context,
                  const CustomSnackBar.success(
                    message: "pet successfully added!",
                  ),
                );
                context.pop();
              }
            },
            color: kPrimaryColor,
            textColor: kWhite,
            size: size,
          );
  }
}
