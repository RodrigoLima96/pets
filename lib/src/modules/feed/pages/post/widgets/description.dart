import 'package:flutter/material.dart';
import 'package:pets/src/shared/utils/constants.dart';

class Description extends StatelessWidget {
  const Description({
    Key? key,
    required this.description,
  }) : super(key: key);

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Text(
        description,
        style: textStyle,
        textAlign: TextAlign.justify,
      ),
    );
  }
}
