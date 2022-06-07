import 'package:flutter/material.dart';
import 'package:pets/src/models/pet.dart';
import 'package:pets/src/modules/profile/pages/settings/edit_pet/petsList/widgets/edit_pets_list_body.dart';
import 'package:pets/src/shared/utils/constants.dart';

class EditPetsListPage extends StatelessWidget {
  final List<Pet> pets;
  const EditPetsListPage({Key? key, required this.pets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      appBar: AppBar(
        backgroundColor: kBlack,
      ),
      body: EditPetsListBody(pets: pets),
    );
  }
}
