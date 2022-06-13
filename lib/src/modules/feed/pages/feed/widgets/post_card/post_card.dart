import 'package:flutter/material.dart';
import 'package:pets/src/models/post.dart' as model;
import 'package:pets/src/modules/feed/pages/post/post_page.dart';
import 'package:pets/src/shared/utils/constants.dart';
import 'package:pets/src/shared/utils/methods.dart';
import 'package:pets/src/shared/widgets/list_images.dart';
import 'package:pets/src/modules/feed/pages/feed/widgets/post_card/pets_info.dart';

class PostCard extends StatefulWidget {
  final Size size;
  final model.Post post;
  const PostCard({Key? key, required this.size, required this.post})
      : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  int indexImage = 1;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: widget.size.height * 0.45,
        width: widget.size.width,
        child: Column(
          children: [
            PetsInfo(
                pets: widget.post.pets, size: widget.size, imageRadius: 12),
            GestureDetector(
              child: ListImages(
                images: widget.post.petsPhotosUrl,
                listLength: widget.post.petsPhotosUrl.length,
                size: widget.size,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PostPage(post: widget.post)));
              },
            ),
            Container(
              width: widget.size.width,
              padding: const EdgeInsets.symmetric(
                vertical: kDefaultPadding / 2,
                horizontal: 15,
              ),
              child: Text(
                dateFormat(widget.post.datePublished),
                style: textStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
