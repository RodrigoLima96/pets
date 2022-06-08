import 'package:flutter/material.dart';
import 'package:pets/src/modules/feed/pages/post/widgets/comments/comment_button.dart';

class PostBottomNavigation extends StatefulWidget {
  final String postId;
  const PostBottomNavigation({Key? key, required this.postId})
      : super(key: key);

  @override
  State<PostBottomNavigation> createState() => _PostBottomNavigationState();
}

class _PostBottomNavigationState extends State<PostBottomNavigation> {
  final TextEditingController commentController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    commentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: kToolbarHeight,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        padding: const EdgeInsets.only(left: 16, right: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 8),
                child: TextField(
                  controller: commentController,
                  decoration: const InputDecoration(
                    hintText: 'Add a comment',
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
            ),
            CommentButton(
              postId: widget.postId,
              commentController: commentController,
            ),
          ],
        ),
      ),
    );
  }
}
