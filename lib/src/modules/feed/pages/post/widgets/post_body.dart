import 'package:flutter/material.dart';
import 'package:pets/src/modules/feed/pages/post/widgets/comments/list_post_comments.dart';
import 'package:pets/src/shared/widgets/pets_list.dart';
import 'package:pets/src/shared/widgets/user_info.dart';
import 'package:pets/src/models/post.dart';
import 'package:pets/src/shared/utils/constants.dart';
import 'package:pets/src/shared/widgets/list_images.dart';

class PostBody extends StatelessWidget {
  final Post post;
  const PostBody({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height,
      width: size.width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListImages(pets: post.pets, size: size),
            const SizedBox(height: 10),
            PetsList(size: size, pets: post.pets, imageRadius: 20),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                post.description,
                style: textStyle,
                textAlign: TextAlign.justify,
              ),
            ),
            const Text('owner', style: textStyle),
            const SizedBox(height: 5),
            UserInfo(
              userPhoto: post.userPhotoUrl,
              username: post.username,
              imageSize: 30,
            ),
            const SizedBox(height: 20),
            ListPostComments(postId: post.postId),
          ],
        ),
      ),
    );
  }
}
