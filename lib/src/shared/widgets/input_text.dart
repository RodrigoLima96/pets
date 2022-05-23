import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final FormFieldValidator<String> validator;
  final TextInputType keyboardType;

  final String? suffixText;

  const InputText({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.validator,
    required this.keyboardType,
    this.suffixText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        suffixText: suffixText,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
