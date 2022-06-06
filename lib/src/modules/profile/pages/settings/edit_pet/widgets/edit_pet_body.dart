import 'package:flutter/material.dart';
import 'package:pets/src/models/pet.dart';
import 'package:pets/src/modules/profile/pages/settings/edit_pet/widgets/edit_pet_form.dart';
import 'package:pets/src/modules/profile/pages/settings/edit_pet/widgets/edit_pet_photo.dart';
import 'package:pets/src/shared/utils/constants.dart';
import 'package:pets/src/shared/widgets/rounded_button.dart';

class EditPetBody extends StatefulWidget {
  const EditPetBody({Key? key}) : super(key: key);

  @override
  State<EditPetBody> createState() => _EditPetBodyState();
}

class _EditPetBodyState extends State<EditPetBody> {
  late final TextEditingController nameController;
  late final TextEditingController weightController;
  late final TextEditingController ageController;
  late final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Pet pet = Pet(
    petName: 'Juca',
    type: 'Dog',
    photoUrl:
        'https://firebasestorage.googleapis.com/v0/b/pets-d0aad.appspot.com/o/pets%2FUuT6Re8vK5PoYL4zMDJoAfjqrAm2%2F9a75bd30-e047-11ec-987c-a7b5c62950d7?alt=media&token=112f8fc3-5de5-4e1b-ba58-33482c8044b1',
    weight: 95.7,
    age: 4,
    gender: 'Female',
    petId: '123456',
    uid: '1234567',
  );

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController(text: pet.petName);
    weightController = TextEditingController(text: pet.weight.toString());
    ageController = TextEditingController(text: pet.age.toString());
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    weightController.dispose();
    ageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: double.infinity,
      padding: EdgeInsets.only(top: size.height * 0.05),
      child: SingleChildScrollView(
        child: Column(
          children: [
            EditPetPhoto(size: size, photo: pet.photoUrl),
            EditPetForm(
              size: size,
              nameController: nameController,
              petType: pet.type,
              petGender: pet.gender,
              weightController: weightController,
              ageController: ageController,
              formKey: _formKey,
            ),
            RoundedButton(
              text: 'UPDATE',
              press: () {},
              color: kPrimaryColor,
              textColor: kWhite,
              size: size,
            ),
          ],
        ),
      ),
    );
  }
}
