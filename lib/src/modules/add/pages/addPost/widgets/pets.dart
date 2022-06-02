import 'package:flutter/material.dart';
import 'package:pets/src/shared/utils/constants.dart';

class Pets extends StatelessWidget {
  final String photo;
  final String name;
  const Pets({Key? key, required this.photo, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(
            photo,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          name,
          style: textStyle.copyWith(fontSize: 18),
        ),
      ],
    );
  }
}
