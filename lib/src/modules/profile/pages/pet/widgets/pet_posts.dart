import 'package:flutter/material.dart';
import 'package:pets/src/models/post.dart';
import 'package:pets/src/shared/widgets/list_images.dart';

class PetPosts extends StatelessWidget {
  final List<Post> posts;
  final Size size;
  const PetPosts({Key? key, required this.posts, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: posts.length,
      itemBuilder: (context, index) => Container(
        padding: const EdgeInsets.only(top: 50),
        child: ListImages(
          listLength: posts[index].petsPhotosUrl.length,
          size: size,
          images: posts[index].petsPhotosUrl,
        ),
      ),
    );
  }
}
