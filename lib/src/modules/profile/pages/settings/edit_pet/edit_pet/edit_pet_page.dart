import 'package:flutter/material.dart';
import 'package:pets/src/models/pet.dart';
import 'package:pets/src/modules/profile/pages/settings/edit_pet/edit_pet/widgets/edit_pet_body.dart';
import 'package:pets/src/shared/utils/constants.dart';

class EditPetPage extends StatelessWidget {
  final Pet pet;
  const EditPetPage({Key? key, required this.pet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      appBar: AppBar(
        backgroundColor: kBlack,
      ),
      body: EditPetBody(pet: pet),
    );
  }
}
