import 'package:flutter/material.dart';
import 'package:pets/src/modules/auth/login/widgets/input_text.dart';
import 'package:pets/src/modules/add/addPet/widgets/pet_photo.dart';
import 'package:pets/src/modules/auth/login/widgets/select_input_text.dart';
import 'package:pets/src/shared/utils/constants.dart';
import 'package:pets/src/shared/widgets/rounded_button.dart';
import 'package:provider/provider.dart';

import '../../controllers/add_controller.dart';

class AddPetBody extends StatelessWidget {
  const AddPetBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextEditingController nameController = TextEditingController();
    final image = context.watch<AddController>().image;

    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: size.height * 0.06),
        child: Column(
          children: [
            PetPhoto(size: size, photo: image!),
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
              child: SelectInputText(labelText: 'Type', items: items),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: size.width * 0.9,
              child: SelectInputText(labelText: 'Gender', items: items),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: size.width * 0.9,
              child: Row(
                children: [
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: SelectInputText(labelText: 'Weight', items: items),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: SelectInputText(labelText: 'Age', items: items),
                  ),
                ],
              ),
            ),
            RoundedButton(
                text: 'ADD',
                press: () {},
                color: kPrimaryColor,
                textColor: kWhite,
                size: size),
          ],
        ),
      ),
    );
  }
}
