import 'package:flutter/material.dart';
import 'package:pets/src/shared/utils/constants.dart';
import 'package:select_form_field/select_form_field.dart';

class SelectInputText extends StatelessWidget {
  // final TextEditingController controller;
  // final String hintText;
  // final FormFieldValidator<String> validator;

  const SelectInputText({
    Key? key,
    // required this.controller,
    // required this.hintText,
    // required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> _items = [
      {
        'value': 'dog',
        'label': 'Dog',
      },
      {
        'value': 'cat',
        'label': 'Cat',
      },
      {
        'value': 'bird',
        'label': 'Bird',
      },
    ];

    return SelectFormField(
      type: SelectFormFieldType.dropdown, // or can be dialog
      labelText: 'Type',
      items: _items,
    );
  }
}
