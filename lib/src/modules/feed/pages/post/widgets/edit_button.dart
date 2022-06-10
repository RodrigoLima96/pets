import 'package:flutter/material.dart';
import 'package:pets/src/models/post.dart';
import 'package:pets/src/modules/feed/controllers/post_controller.dart';
import 'package:pets/src/modules/feed/pages/editPost/edit_post_page.dart';
import 'package:pets/src/shared/utils/constants.dart';
import 'package:provider/provider.dart';

class EditButton extends StatelessWidget {
  final Post post;

  const EditButton({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = context.watch<PostController>();

    return controller.uid == post.uid
        ? IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => EditPostPage(post: post),
                ),
              );
            },
            icon: const Icon(
              Icons.edit,
              color: kPrimaryColor,
            ),
          )
        : const SizedBox();
  }
}
