import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pets/src/models/pet.dart';
import 'package:pets/src/modules/add/controllers/add_post_controller.dart';
import 'package:pets/src/modules/add/pages/addPost/widgets/add_post_body.dart';
import 'package:pets/src/shared/utils/constants.dart';
import 'package:provider/provider.dart';

class AddPostPage extends StatelessWidget {
  final List<Pet> pets;
  const AddPostPage({Key? key, required this.pets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = context.read<AddPostController>();
    return Scaffold(
      backgroundColor: kBlack,
      appBar: AppBar(
        backgroundColor: kBlack,
        leading: IconButton(
          onPressed: () {
            controller.clearImage();
            context.pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: AddPostBody(pets: pets),
    );
  }
}
