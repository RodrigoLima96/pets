import 'package:flutter/material.dart';
import 'package:pets/src/modules/add/widgets/go_add_pet.dart';

class AddBody extends StatelessWidget {
  const AddBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      padding: EdgeInsets.only(top: size.height * 0.1),
      child: SingleChildScrollView(
        child: Column(
          children: const [
            GoAddPet(),
          ],
        ),
      ),
    );
  }
}
