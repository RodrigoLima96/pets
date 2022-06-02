import 'package:flutter/material.dart';
import 'package:pets/src/models/pet.dart';
import 'package:pets/src/modules/add/pages/addPost/widgets/pets.dart';

class PetsListPost extends StatelessWidget {
  final Size size;
  final List<Pet> pets;
  const PetsListPost({Key? key, required this.size, required this.pets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.15,
      width: double.infinity,
      margin: EdgeInsets.only(top: size.height * 0.05),
      child: Center(
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int i) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Pets(
                photo: pets[i].photoUrl,
                name: pets[i].petName,
              ),
            );
          },
          itemCount: pets.length,
        ),
      ),
    );
  }
}
