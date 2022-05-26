import 'package:flutter/material.dart';
import 'package:pets/src/modules/add/addPost/controllers/add_post_validator_controller.dart';

class InputDescription extends StatelessWidget {
  final Size size;
  final TextEditingController descriptionController;
  final AddPostValidatorController _validadorController;
  final double padding;
  const InputDescription({
    Key? key,
    required this.size,
    required this.descriptionController,
    required AddPostValidatorController validadorController,
    required this.padding,
  })  : _validadorController = validadorController,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      padding: EdgeInsets.only(top: padding),
      child: TextFormField(
        textAlign: TextAlign.center,
        controller: descriptionController,
        decoration: const InputDecoration(
          hintText: 'Write a description...',
          border: InputBorder.none,
        ),
        maxLines: 4,
        validator: (value) {
          return _validadorController.descriptionValidator(value!);
        },
      ),
    );
  }
}
