import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';

class SelectInputText extends StatelessWidget {
  final String labelText;
  final List<Map<String, dynamic>> items;
  final FormFieldValidator<String> validator;

  final TextEditingController controller;

  const SelectInputText({
    Key? key,
    required this.labelText,
    required this.items,
    required this.controller,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectFormField(
      validator: validator,
      controller: controller,
      type: SelectFormFieldType.dropdown, // or can be dialog
      labelText: labelText,
      items: items,
    );
  }
}
