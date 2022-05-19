import 'package:flutter/material.dart';
import 'package:pets/src/modules/add/add/widgets/go_add_pet.dart';
import 'package:pets/src/modules/add/add/widgets/header_post.dart';
import 'package:pets/src/modules/add/add/widgets/pets_list.dart';

class AddBody extends StatelessWidget {
  const AddBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      padding: EdgeInsets.only(top: size.height * 0.1),
      child: Column(
        children: [
          const GoAddPet(),
          SizedBox(height: size.height * 0.05),
          HeaderPost(size: size),
          PetsList(size: size),
        ],
      ),
    );
  }
}
