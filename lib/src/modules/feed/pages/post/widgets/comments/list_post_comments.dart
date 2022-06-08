import 'package:flutter/material.dart';
import 'package:pets/src/modules/feed/controllers/post_controller.dart';
import 'package:pets/src/modules/feed/pages/post/widgets/comments/comment_card.dart';
import 'package:provider/provider.dart';

class ListPostComments extends StatefulWidget {
  final String postId;
  const ListPostComments({
    Key? key,
    required this.postId,
  }) : super(key: key);

  @override
  State<ListPostComments> createState() => _ListPostCommentsState();
}

class _ListPostCommentsState extends State<ListPostComments> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => context.read<PostController>().getComments(widget.postId));
  }

  @override
  Widget build(BuildContext context) {
    var controller = context.watch<PostController>();

    return controller.commentsState == PostState.loading
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: controller.comments.length,
            itemBuilder: (context, index) {
              return CommentCard(comment: controller.comments[index]);
            });
  }
}
