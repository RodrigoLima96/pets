import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pets/src/models/post.dart';
import 'package:pets/src/modules/feed/controllers/post_controller.dart';
import 'package:pets/src/shared/utils/constants.dart';
import 'package:pets/src/shared/utils/methods.dart';
import 'package:pets/src/shared/widgets/rounded_button.dart';
import 'package:provider/provider.dart';

class EditPostButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final Size size;
  final Post post;
  final TextEditingController description;

  const EditPostButton({
    Key? key,
    required this.size,
    required this.formKey,
    required this.post,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<PostController>();

    return controller.editPostState == PostState.loading
        ? loadingWidget()
        : RoundedButton(
            text: 'UPDATE',
            press: () async {
              if (formKey.currentState!.validate()) {
                String status =
                    await controller.editPost(description.text, post);
                await showSnackBar(context, status);
                context.pop();
              }
            },
            color: kPrimaryColor,
            textColor: kWhite,
            size: size,
          );
  }
}
