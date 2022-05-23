import 'package:flutter/material.dart';
import 'package:pets/src/modules/add/addPost/widgets/add_post_body.dart';
import 'package:pets/src/shared/models/pet.dart';
import 'package:pets/src/shared/utils/constants.dart';

class AddPostPage extends StatelessWidget {
  final List<Pet> pets;
  const AddPostPage({Key? key, required this.pets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      body: AddPostBody(pets: pets),
    );
  }
}
