import 'package:flutter/material.dart';
import 'package:pets/src/models/pet.dart';
import 'package:pets/src/modules/profile/pages/pet/widgets/pet_page_body.dart';
import 'package:pets/src/shared/utils/constants.dart';

class PetPage extends StatelessWidget {
  final Pet pet;
  const PetPage({Key? key, required this.pet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      appBar: AppBar(
        backgroundColor: kBlack,
      ),
      body: PetPageBody(pet: pet),
    );
  }
}
