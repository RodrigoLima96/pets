import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pets/src/modules/add/pages/addPet/widgets/add_pet_button.dart';
import 'package:pets/src/modules/add/pages/addPet/widgets/add_pet_form.dart';
import 'package:pets/src/modules/add/pages/addPet/widgets/pet_photo.dart';

class AddPetBody extends StatefulWidget {
  final Uint8List image;

  const AddPetBody({Key? key, required this.image}) : super(key: key);

  @override
  State<AddPetBody> createState() => _AddPetBodyState();
}

class _AddPetBodyState extends State<AddPetBody> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    typeController.dispose();
    genderController.dispose();
    weightController.dispose();
    ageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: size.height * 0.06),
        child: Column(
          children: [
            PetPhoto(size: size, photo: widget.image),
            const SizedBox(height: 20),
            AddPetForm(
              formKey: _formKey,
              size: size,
              nameController: nameController,
              typeController: typeController,
              genderController: genderController,
              weightController: weightController,
              ageController: ageController,
            ),
            AddPetButton(
              formKey: _formKey,
              size: size,
              image: widget.image,
              nameController: nameController,
              typeController: typeController,
              genderController: genderController,
              weightController: weightController,
              ageController: ageController,
            ),
          ],
        ),
      ),
    );
  }
}
