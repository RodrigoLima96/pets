import 'package:flutter/material.dart';
import 'package:pets/src/modules/auth/login/widgets/input_text.dart';
import 'package:pets/src/modules/add/addPet/widgets/pet_photo.dart';
import 'package:pets/src/modules/auth/login/widgets/select_input_text.dart';

class AddPetBody extends StatelessWidget {
  const AddPetBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextEditingController nameController = TextEditingController();

    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: size.height * 0.06),
        child: Column(
          children: [
            PetPhoto(
                size: size,
                photo:
                    'https://firebasestorage.googleapis.com/v0/b/pets-d0aad.appspot.com/o/posts%2FUuT6Re8vK5PoYL4zMDJoAfjqrAm2%2Fangel-luciano-LATYeZyw88c-unsplash%20(1).jpg?alt=media&token=274a1604-e6ef-4cf1-ba03-73f11fe66634'),
            const SizedBox(height: 20),
            SizedBox(
              width: size.width * 0.9,
              child: InputText(
                  controller: nameController,
                  hintText: 'Name...',
                  validator: (value) => null),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: size.width * 0.9,
              child: const SelectInputText(),
            ),
          ],
        ),
      ),
    );
  }
}
