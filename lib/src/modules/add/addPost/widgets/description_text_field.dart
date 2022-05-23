import 'package:flutter/material.dart';

class DescriptionTextField extends StatelessWidget {
  const DescriptionTextField({
    Key? key,
    required this.size,
    required this.descriptionController,
  }) : super(key: key);

  final Size size;
  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      child: TextField(
        textAlign: TextAlign.center,
        controller: descriptionController,
        decoration: const InputDecoration(
          hintText: 'Write a description...',
          border: InputBorder.none,
        ),
        maxLines: 5,
      ),
    );
  }
}
