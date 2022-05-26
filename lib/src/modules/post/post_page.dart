import 'package:flutter/material.dart';
import 'package:pets/src/modules/post/widgets/post_body.dart';
import 'package:pets/src/shared/utils/constants.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kBlack,
      body: PostBody(),
    );
  }
}
