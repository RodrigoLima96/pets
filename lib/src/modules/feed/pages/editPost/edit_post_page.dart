import 'package:flutter/material.dart';
import 'package:pets/src/models/post.dart';
import 'package:pets/src/modules/feed/pages/editPost/widgets/delete_post_button.dart';
import 'package:pets/src/modules/feed/pages/editPost/widgets/edit_post_body.dart';
import 'package:pets/src/shared/utils/constants.dart';

class EditPostPage extends StatelessWidget {
  final Post post;
  const EditPostPage({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      appBar: AppBar(
        backgroundColor: kBlack,
        actions: [
          DeletePostButton(post: post),
        ],
      ),
      body: EditPostBody(post: post),
    );
  }
}
