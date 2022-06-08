import 'package:flutter/material.dart';
import 'package:pets/src/modules/feed/controllers/post_controller.dart';
import 'package:provider/provider.dart';

class CommentButton extends StatefulWidget {
  final String postId;
  final TextEditingController commentController;
  const CommentButton({
    Key? key,
    required this.postId,
    required this.commentController,
  }) : super(key: key);

  @override
  State<CommentButton> createState() => _CommentButtonState();
}

class _CommentButtonState extends State<CommentButton> {
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<PostController>();

    return controller.postCommentState == PostState.loading
        ? const Center(child: CircularProgressIndicator())
        : TextButton(
            onPressed: () {
              if (widget.commentController.text != '') {
                controller.addComment(
                    widget.postId, widget.commentController.text);
                setState(() {
                  widget.commentController.text = '';
                });
              }
            },
            child: const Text(
              'Comment',
              style: TextStyle(color: Colors.blue),
            ),
          );
  }
}
