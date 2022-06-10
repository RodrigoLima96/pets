import 'package:flutter/material.dart';
import 'package:pets/src/models/post.dart';
import 'package:pets/src/modules/feed/controllers/post_controller.dart';
import 'package:pets/src/shared/utils/methods.dart';
import 'package:provider/provider.dart';

class DeletePostButton extends StatelessWidget {
  final Post post;
  const DeletePostButton({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = context.watch<PostController>();

    return controller.uid == post.uid
        ? IconButton(
            onPressed: () {
              controller.deletePost(post);
              Navigator.pop(context);
              Navigator.pop(context);
              showSnackBar(context, 'post successfully deleted!');
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.redAccent,
            ),
          )
        : const SizedBox();
  }
}
