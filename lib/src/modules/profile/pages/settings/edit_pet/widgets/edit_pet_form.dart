import 'package:flutter/material.dart';
import 'package:pets/src/shared/utils/validator.dart';
import 'package:pets/src/shared/widgets/input_text.dart';
import 'package:pets/src/shared/utils/constants.dart';
import 'package:provider/provider.dart';

class EditPetForm extends StatelessWidget {
  final Size size;
  final TextEditingController nameController;
  final String petType;
  final String petGender;
  final TextEditingController weightController;
  final TextEditingController ageController;
  final GlobalKey<FormState> formKey;

  const EditPetForm({
    Key? key,
    required this.size,
    required this.nameController,
    required this.petType,
    required this.petGender,
    required this.weightController,
    required this.ageController,
    required this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _validadorController = context.read<Validator>();

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
            child: TextFormField(
              style: const TextStyle(color: kPrimaryColor),
              readOnly: true,
              initialValue: petType,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: size.width * 0.9,
            child: TextFormField(
              style: const TextStyle(color: kPrimaryColor),
              readOnly: true,
              initialValue: petGender,
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
