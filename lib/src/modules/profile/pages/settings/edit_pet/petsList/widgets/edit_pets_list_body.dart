import 'package:flutter/material.dart';
import 'package:pets/src/models/pet.dart';
import 'package:pets/src/modules/profile/pages/settings/edit_pet/edit_pet/edit_pet_page.dart';
import 'package:pets/src/shared/utils/constants.dart';

class EditPetsListBody extends StatelessWidget {
  final List<Pet> pets;
  const EditPetsListBody({Key? key, required this.pets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: double.infinity,
      child: ListView.builder(
          itemCount: pets.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 50),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditPetPage(pet: pets[index])));
                },
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                        pets[index].photoUrl,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(pets[index].petName, style: textStyle),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
