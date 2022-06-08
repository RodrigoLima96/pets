import 'package:flutter/material.dart';
import 'package:pets/src/models/comment.dart';
import 'package:pets/src/modules/feed/controllers/post_controller.dart';
import 'package:provider/provider.dart';

class DeleteCommentButton extends StatelessWidget {
  final Comment comment;
  const DeleteCommentButton({
    Key? key,
    required this.comment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = context.read<PostController>();
    return controller.uid == comment.uid
        ? IconButton(
            onPressed: () {
              controller.deleteComment(comment);
            },
            icon: const Icon(
              Icons.delete,
              size: 16,
              color: Colors.redAccent,
            ),
          )
        : const SizedBox();
  }
}
