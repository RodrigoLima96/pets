import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pets/src/modules/add/controllers/add_pet_controller.dart';
import 'package:pets/src/modules/add/pages/addPet/widgets/add_pet_body.dart';
import 'package:pets/src/modules/add/pages/addPet/widgets/add_photo_button.dart';
import 'package:pets/src/shared/utils/constants.dart';
import 'package:provider/provider.dart';

class AddPetPage extends StatefulWidget {
  const AddPetPage({Key? key}) : super(key: key);

  @override
  State<AddPetPage> createState() => _AddPetPageState();
}

class _AddPetPageState extends State<AddPetPage> {
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AddPetController>();

    return Scaffold(
        backgroundColor: kBlack,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kBlack,
          leading: BackButton(
            onPressed: () {
              if (controller.image == null) {
                context.pop();
              }
              controller.clearImage();
            },
          ),
        ),
        body: controller.image == null
            ? const AddPhotoButton()
            : AddPetBody(image: controller.image!));
  }
}
