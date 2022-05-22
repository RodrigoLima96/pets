import 'package:flutter/material.dart';
import 'package:pets/src/modules/add/addPost/widgets/add_post_body.dart';
import 'package:pets/src/shared/utils/constants.dart';

class AddPostPage extends StatelessWidget {
  const AddPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kBlack,
      body: AddPostBody(),
    );
  }
}
