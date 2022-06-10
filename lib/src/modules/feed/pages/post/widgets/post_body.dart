import 'package:flutter/material.dart';
import 'package:pets/src/modules/feed/pages/post/widgets/comments/list_post_comments.dart';
import 'package:pets/src/modules/feed/pages/post/widgets/description.dart';
import 'package:pets/src/shared/widgets/pets_list.dart';
import 'package:pets/src/shared/widgets/user_info.dart';
import 'package:pets/src/models/post.dart';
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
            ListImages(
              images: post.petsPhotosUrl,
              listLength: post.petsPhotosUrl.length,
              size: size,
            ),
            const SizedBox(height: 10),
            PetsList(size: size, pets: post.pets, imageRadius: 20),
            Description(description: post.description),
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
