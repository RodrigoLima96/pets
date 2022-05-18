import 'package:flutter/material.dart';
import 'package:pets/src/modules/add/controllers/add_validator_controller.dart';
import 'package:pets/src/modules/auth/login/widgets/input_text.dart';
import 'package:pets/src/modules/auth/login/widgets/select_input_text.dart';
import 'package:pets/src/shared/utils/constants.dart';
import 'package:provider/provider.dart';

class AddPetForm extends StatelessWidget {
  final Size size;
  final TextEditingController nameController;
  final TextEditingController typeController;
  final TextEditingController genderController;
  final TextEditingController weightController;
  final TextEditingController ageController;
  final GlobalKey<FormState> formKey;

  const AddPetForm({
    Key? key,
    required this.size,
    required this.nameController,
    required this.typeController,
    required this.genderController,
    required this.weightController,
    required this.ageController,
    required this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _validadorController = context.read<AddPetValidatorController>();

    return Form(
      key: formKey,
      child: Column(
        children: [
          SizedBox(
            width: size.width * 0.9,
            child: InputText(
                controller: nameController,
                hintText: 'Name',
                keyboardType: TextInputType.text,
                validator: (value) {
                  return _validadorController.nameValidator(value!);
                }),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: size.width * 0.9,
            child: SelectInputText(
              labelText: 'Type',
              items: typeItems,
              controller: typeController,
              validator: (value) {
                return _validadorController.typeValidator(value!);
              },
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: size.width * 0.9,
            child: SelectInputText(
              labelText: 'Gender',
              items: genderItems,
              controller: genderController,
              validator: (value) {
                return _validadorController.genderValidator(value!);
              },
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
                  child: InputText(
                    hintText: 'Weight',
                    controller: weightController,
                    suffixText: 'lbs',
                    keyboardType: TextInputType.number,
                    validator: (String? value) {
                      return _validadorController.weightValidator(value!);
                    },
                  ),
                ),
                const Spacer(),
                SizedBox(
                  height: 150,
                  width: 150,
                  child: InputText(
                    hintText: 'Age',
                    controller: ageController,
                    suffixText: 'years',
                    keyboardType: TextInputType.number,
                    validator: (String? value) {
                      return _validadorController.ageValidator(value!);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
