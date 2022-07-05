import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pets/src/modules/profile/controllers/edit_pet_controller.dart';
import 'package:pets/src/routes/router_utils.dart';
import 'package:pets/src/shared/utils/constants.dart';
import 'package:pets/src/shared/utils/methods.dart';
import 'package:pets/src/shared/widgets/rounded_button.dart';
import 'package:provider/provider.dart';

class UpdatePetButton extends StatelessWidget {
  final Size size;
  final String uid;
  final String petId;
  final TextEditingController petName;
  final TextEditingController petWeight;
  final TextEditingController petAge;
  final GlobalKey<FormState> formKey;

  const UpdatePetButton({
    Key? key,
    required this.size,
    required this.uid,
    required this.petId,
    required this.petName,
    required this.petWeight,
    required this.petAge,
    required this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<EditPetController>();
    return controller.state == EditPetState.loading
        ? const Center(child: CircularProgressIndicator())
        : Padding(
            padding: EdgeInsets.only(top: size.height * 0.1),
            child: RoundedButton(
              text: 'UPDATE',
              press: () {
                if (formKey.currentState!.validate()) {
                  controller.updatePet(uid, petId, petName.text,
                      double.parse(petWeight.text), int.parse(petAge.text));
                  controller.addListener(
                    () {
                      if (controller.state == EditPetState.success) {
                        showSnackBar(context, 'update success');
                        controller.clearImage();
                        context.goNamed(AppPage.home.toName);
                      }
                    },
                  );
                }
              },
              color: kPrimaryColor,
              textColor: kWhite,
              size: size,
            ),
          );
  }
}
