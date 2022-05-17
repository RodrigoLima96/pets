import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pets/src/modules/add/addPet/widgets/add_pet_button.dart';
import 'package:pets/src/modules/auth/login/widgets/input_text.dart';
import 'package:pets/src/modules/add/addPet/widgets/pet_photo.dart';
import 'package:pets/src/modules/auth/login/widgets/select_input_text.dart';
import 'package:pets/src/shared/utils/constants.dart';

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
            SizedBox(
              width: size.width * 0.9,
              child: InputText(
                  controller: nameController,
                  hintText: 'Name',
                  validator: (value) => null),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: size.width * 0.9,
              child: SelectInputText(
                labelText: 'Type',
                items: typeItems,
                controller: typeController,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: size.width * 0.9,
              child: SelectInputText(
                labelText: 'Gender',
                items: genderItems,
                controller: genderController,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: size.width * 0.9,
              child: Row(
                children: [
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: SelectInputText(
                      labelText: 'Weight',
                      items: weightItems,
                      controller: weightController,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: SelectInputText(
                      labelText: 'Age',
                      items: ageItems,
                      controller: ageController,
                    ),
                  ),
                ],
              ),
            ),
            AddPetButton(
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
