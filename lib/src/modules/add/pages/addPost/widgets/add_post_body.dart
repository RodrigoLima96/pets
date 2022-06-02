import 'package:flutter/material.dart';
import 'package:pets/src/models/pet.dart';
import 'package:pets/src/modules/add/pages/addPost/widgets/add_post_button.dart';
import 'package:pets/src/modules/add/pages/addPost/widgets/add_post_form.dart';
import 'package:pets/src/modules/add/pages/addPost/widgets/pets_list_post.dart';
import 'package:pets/src/shared/utils/constants.dart';

class AddPostBody extends StatefulWidget {
  final List<Pet> pets;

  const AddPostBody({Key? key, required this.pets}) : super(key: key);

  @override
  State<AddPostBody> createState() => _AddPostBodyState();
}

class _AddPostBodyState extends State<AddPostBody> {
  final TextEditingController priceController = TextEditingController();
  final TextEditingController daysController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    priceController.dispose();
    daysController.dispose();
    descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: double.infinity,
      padding: EdgeInsets.only(top: size.height * 0.1),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PetsListPost(size: size, pets: widget.pets),
            Text(widget.pets.length.toString(),
                style: textStyle.copyWith(fontSize: 18)),
            AddPostForm(
              size: size,
              priceController: priceController,
              daysController: daysController,
              descriptionController: descriptionController,
              formKey: _formKey,
            ),
            AddPostButton(
              size: size,
              formKey: _formKey,
              pets: widget.pets,
              priceController: priceController,
              daysController: daysController,
              descriptionController: descriptionController,
            ),
          ],
        ),
      ),
    );
  }
}
