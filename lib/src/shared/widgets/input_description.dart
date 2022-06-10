import 'package:flutter/material.dart';
import 'package:pets/src/shared/utils/validator.dart';

class InputDescription extends StatelessWidget {
  final Size size;
  final TextEditingController descriptionController;
  final double padding;
  final Validator validator;
  final bool autoFocus;
  const InputDescription({
    Key? key,
    required this.size,
    required this.descriptionController,
    required this.padding,
    required this.validator,
    this.autoFocus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      padding: EdgeInsets.only(top: padding),
      child: TextFormField(
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        controller: descriptionController,
        decoration: const InputDecoration(
          hintText: 'Write a description...',
          border: InputBorder.none,
        ),
        maxLines: 4,
        validator: (value) {
          return validator.descriptionValidator(value!);
        },
      ),
    );
  }
}
