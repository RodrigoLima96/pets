import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pets/src/models/pet.dart';
import 'package:pets/src/routes/router_utils.dart';
import 'package:pets/src/shared/utils/constants.dart';

class EditPetsListBody extends StatelessWidget {
  final List<Pet> pets;
  const EditPetsListBody({Key? key, required this.pets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: double.infinity,
      child: pets.isEmpty
          ? const Center(child: Text('No Pets Yet', style: textStyle))
          : ListView.builder(
              itemCount: pets.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: GestureDetector(
                    onTap: () => context.push(AppPage.editPet.toPath,
                        extra: pets[index]),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(
                            pets[index].photoUrl,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(pets[index].petName, style: textStyle),
                        ),
                      ],
                    ),
                  ),
                );
              }),
    );
  }
}
