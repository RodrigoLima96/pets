import 'package:flutter/material.dart';
import 'package:pets/src/models/pet.dart';
import 'package:pets/src/modules/profile/pages/settings/edit_pet/edit_pet/widgets/edit_pet_form.dart';
import 'package:pets/src/modules/profile/pages/settings/edit_pet/edit_pet/widgets/edit_pet_photo.dart';
import 'package:pets/src/modules/profile/pages/settings/edit_pet/edit_pet/widgets/update_pet_button.dart';

class EditPetBody extends StatefulWidget {
  final Pet pet;
  const EditPetBody({Key? key, required this.pet}) : super(key: key);

  @override
  State<EditPetBody> createState() => _EditPetBodyState();
}

class _EditPetBodyState extends State<EditPetBody> {
  late final TextEditingController nameController;
  late final TextEditingController weightController;
  late final TextEditingController ageController;
  late final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController(text: widget.pet.petName);
    weightController =
        TextEditingController(text: widget.pet.weight.toString());
    ageController = TextEditingController(text: widget.pet.age.toString());
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
            EditPetPhoto(size: size, photo: widget.pet.photoUrl),
            EditPetForm(
              size: size,
              nameController: nameController,
              petType: widget.pet.type,
              petGender: widget.pet.gender,
              weightController: weightController,
              ageController: ageController,
              formKey: _formKey,
            ),
            UpdatePetButton(
              size: size,
              uid: widget.pet.uid,
              petId: widget.pet.petId,
              petName: nameController,
              petWeight: weightController,
              petAge: ageController,
              formKey: _formKey,
            ),
          ],
        ),
      ),
    );
  }
}
