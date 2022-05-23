import 'package:flutter/material.dart';
import 'package:pets/src/modules/add/addPost/controllers/add_post_validator_controller.dart';
import 'package:pets/src/shared/widgets/input_text.dart';
import 'package:provider/provider.dart';

class AddPostForm extends StatelessWidget {
  final Size size;
  final TextEditingController priceController;
  final TextEditingController daysController;
  final TextEditingController descriptionController;
  final GlobalKey<FormState> formKey;

  const AddPostForm({
    Key? key,
    required this.size,
    required this.priceController,
    required this.daysController,
    required this.descriptionController,
    required this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _validadorController = context.read<AddPostValidatorController>();

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.2, vertical: size.height * 0.05),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: size.width * 0.2,
                  child: InputText(
                    controller: priceController,
                    hintText: 'Price',
                    validator: (value) {
                      return _validadorController.priceValidator(value!);
                    },
                    keyboardType: TextInputType.number,
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: size.width * 0.2,
                  child: InputText(
                    controller: daysController,
                    hintText: 'Days',
                    validator: (value) {
                      return _validadorController.daysValidator(value!);
                    },
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            Container(
              width: size.width,
              padding: EdgeInsets.only(top: size.height * 0.1),
              child: TextFormField(
                textAlign: TextAlign.center,
                controller: descriptionController,
                decoration: const InputDecoration(
                  hintText: 'Write a description...',
                  border: InputBorder.none,
                ),
                maxLines: 5,
                validator: (value) {
                  return _validadorController.descriptionValidator(value!);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
