import 'package:flutter/material.dart';
import 'package:pets/src/models/post.dart';
import 'package:pets/src/modules/feed/pages/editPost/widgets/edit_post_button.dart';
import 'package:pets/src/shared/utils/validator.dart';
import 'package:pets/src/shared/widgets/input_description.dart';
import 'package:pets/src/shared/widgets/list_images.dart';
import 'package:provider/provider.dart';

class EditPostBody extends StatefulWidget {
  final Post post;
  const EditPostBody({Key? key, required this.post}) : super(key: key);

  @override
  State<EditPostBody> createState() => _EditPostBodyState();
}

class _EditPostBodyState extends State<EditPostBody> {
  late final TextEditingController _descriptionController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _descriptionController =
        TextEditingController(text: widget.post.description);
  }

  @override
  void dispose() {
    super.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final _validadorController = context.read<Validator>();

    return SingleChildScrollView(
      child: Container(
        height: size.height,
        width: size.width,
        padding: EdgeInsets.only(top: size.height * 0.1),
        child: Column(
          children: [
            ListImages(
              listLength: widget.post.petsPhotosUrl.length,
              size: size,
              images: widget.post.petsPhotosUrl,
            ),
            Form(
              key: _formKey,
              child: InputDescription(
                autoFocus: true,
                size: size,
                descriptionController: _descriptionController,
                padding: size.height * 0.05,
                validator: _validadorController,
              ),
            ),
            EditPostButton(
              size: size,
              formKey: _formKey,
              postId: widget.post.postId,
              description: _descriptionController,
            ),
          ],
        ),
      ),
    );
  }
}
