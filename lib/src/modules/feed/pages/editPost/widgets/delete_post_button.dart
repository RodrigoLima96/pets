import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pets/src/models/post.dart';
import 'package:pets/src/modules/feed/controllers/post_controller.dart';
import 'package:pets/src/routes/router_utils.dart';
import 'package:pets/src/shared/utils/methods.dart';
import 'package:provider/provider.dart';

class DeletePostButton extends StatefulWidget {
  final Post post;
  const DeletePostButton({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  State<DeletePostButton> createState() => _DeletePostButtonState();
}

class _DeletePostButtonState extends State<DeletePostButton> {
  @override
  Widget build(BuildContext context) {
    var controller = context.watch<PostController>();

    return controller.uid == widget.post.uid
        ? IconButton(
            onPressed: () {
              confirmDialog(context, () {
                controller.deletePost(widget.post);
                context.goNamed(AppPage.home.name);
                showSnackBar(context, 'post successfully deleted!');
              });
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.redAccent,
            ),
          )
        : const SizedBox();
  }
}
