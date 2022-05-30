import 'package:flutter/material.dart';
import 'package:pets/src/modules/profile/widgets/user_pets_avatar.dart';
import 'package:pets/src/shared/models/pet.dart';

class PetsList extends StatelessWidget {
  const PetsList({
    Key? key,
    required this.size,
    required this.pets,
  }) : super(key: key);

  final Size size;
  final List<Pet> pets;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.11,
      width: size.width,
      child: Center(
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: pets.length,
          itemBuilder: (context, index) {
            return UserPetsAvatar(
                petPhoto: pets[index].photoUrl, petName: pets[index].petName);
          },
        ),
      ),
    );
  }
}
