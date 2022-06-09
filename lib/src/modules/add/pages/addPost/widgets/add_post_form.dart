import 'package:flutter/material.dart';
import 'package:pets/src/shared/utils/validator.dart';
import 'package:pets/src/shared/widgets/input_description.dart';
import 'package:provider/provider.dart';

class AddPostForm extends StatelessWidget {
  final Size size;
  final TextEditingController descriptionController;
  final GlobalKey<FormState> formKey;

  const AddPostForm({
    Key? key,
    required this.size,
    required this.descriptionController,
    required this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _validadorController = context.read<Validator>();

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.2, vertical: size.height * 0.05),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            InputDescription(
              size: size,
              descriptionController: descriptionController,
              validator: _validadorController,
              padding: size.height * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}
