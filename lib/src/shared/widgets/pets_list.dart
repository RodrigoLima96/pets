import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pets/src/models/pet.dart';
import 'package:pets/src/routes/router_utils.dart';
import 'package:pets/src/shared/widgets/user_pets_avatar.dart';

class PetsList extends StatelessWidget {
  final Size size;
  final List<Pet> pets;
  final double imageRadius;

  const PetsList({
    Key? key,
    required this.size,
    required this.pets,
    required this.imageRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.1,
      width: size.width,
      child: Center(
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: pets.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => context.push(AppPage.pet.toPath, extra: pets[index]),
              child: UserPetsAvatar(
                petPhoto: pets[index].photoUrl,
                petName: pets[index].petName,
                imageRadius: imageRadius,
              ),
            );
          },
        ),
      ),
    );
  }
}
