import 'package:flutter/material.dart';
import 'package:pets/src/models/post.dart';
import 'package:pets/src/modules/feed/pages/post/widgets/comments/bottom_navigation.dart';
import 'package:pets/src/modules/feed/pages/post/widgets/edit_button.dart';
import 'package:pets/src/modules/feed/pages/post/widgets/post_body.dart';
import 'package:pets/src/shared/utils/constants.dart';

class PostPage extends StatelessWidget {
  final Post post;
  const PostPage({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      appBar: AppBar(
        backgroundColor: kBlack,
        actions: [
          EditButton(post: post),
        ],
      ),
      body: PostBody(post: post),
      bottomNavigationBar: PostBottomNavigation(postId: post.postId),
    );
  }
}
