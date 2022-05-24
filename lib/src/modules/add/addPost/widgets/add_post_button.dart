import 'package:flutter/material.dart';
import 'package:pets/src/modules/add/addPost/controllers/add_post_controller.dart';
import 'package:pets/src/modules/home/home_page.dart';
import 'package:pets/src/shared/models/pet.dart';
import 'package:pets/src/shared/utils/constants.dart';
import 'package:pets/src/shared/widgets/rounded_button.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AddPostButton extends StatelessWidget {
  final List<Pet> pets;
  final GlobalKey<FormState> formKey;
  final TextEditingController priceController;
  final TextEditingController daysController;
  final TextEditingController descriptionController;
  final Size size;

  const AddPostButton({
    Key? key,
    required this.size,
    required this.formKey,
    required this.pets,
    required this.priceController,
    required this.daysController,
    required this.descriptionController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AddPostController>();

    return controller.state == AddPostState.loading
        ? SizedBox(
            height: size.height * 0.09,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          )
        : RoundedButton(
            text: 'POST',
            press: () async {
              if (formKey.currentState!.validate()) {
                await controller.addPost(
                  pets,
                  double.parse(priceController.text),
                  int.parse(daysController.text),
                  descriptionController.text,
                );
                showTopSnackBar(
                  context,
                  const CustomSnackBar.success(
                    message: "post successfully added!",
                  ),
                );
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const HomePage()));
              }
            },
            color: kPrimaryColor,
            textColor: kWhite,
            size: size,
          );
  }
}
