import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pets/src/models/pet.dart';
import 'package:pets/src/modules/add/controllers/add_post_controller.dart';
import 'package:pets/src/modules/add/pages/addPost/widgets/add_post_button.dart';
import 'package:pets/src/modules/add/pages/addPost/widgets/add_post_form.dart';
import 'package:pets/src/modules/add/pages/addPost/widgets/pets_list_post.dart';
import 'package:pets/src/shared/utils/constants.dart';
import 'package:pets/src/shared/widgets/list_images.dart';
import 'package:provider/provider.dart';

class AddPostBody extends StatefulWidget {
  final List<Pet> pets;

  const AddPostBody({Key? key, required this.pets}) : super(key: key);

  @override
  State<AddPostBody> createState() => _AddPostBodyState();
}

class _AddPostBodyState extends State<AddPostBody> {
  final TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final controller = context.watch<AddPostController>();

    return Container(
      height: size.height,
      width: double.infinity,
      padding: EdgeInsets.only(top: size.height * 0.01),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PetsListPost(size: size, pets: widget.pets),
            Text(widget.pets.length.toString(),
                style: textStyle.copyWith(fontSize: 18)),
            controller.images == null
                ? Padding(
                    padding: EdgeInsets.only(top: size.height * 0.1),
                    child: GestureDetector(
                      child: Center(
                        child: Container(
                          height: 100,
                          width: 200,
                          color: Colors.transparent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/gallery.svg',
                                color: kPrimaryColor,
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                'Add Photos',
                                style: textStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () => controller.addImage(),
                    ),
                  )
                : Column(
                    children: [
                      SizedBox(height: size.height * 0.02),
                      ListImages(
                        images: null,
                        files: controller.images,
                        listLength: controller.images!.length,
                        size: size,
                      ),
                      AddPostForm(
                        size: size,
                        descriptionController: descriptionController,
                        formKey: _formKey,
                      ),
                      AddPostButton(
                        size: size,
                        formKey: _formKey,
                        descriptionController: descriptionController,
                        pets: widget.pets,
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
