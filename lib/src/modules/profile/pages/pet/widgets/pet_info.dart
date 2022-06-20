import 'package:flutter/material.dart';
import 'package:pets/src/models/pet.dart';
import 'package:pets/src/shared/utils/constants.dart';

class PetInfo extends StatelessWidget {
  const PetInfo({
    Key? key,
    required this.pet,
  }) : super(key: key);

  final Pet pet;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text(pet.age.toString(), style: textStyle),
            const Text('years', style: TextStyle(color: Colors.grey)),
          ],
        ),
        Text(pet.gender, style: const TextStyle(color: Colors.grey)),
        Column(
          children: [
            Text(pet.weight.toString(), style: textStyle),
            const Text('lbs', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ],
    );
  }
}
