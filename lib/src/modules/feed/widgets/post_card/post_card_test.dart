import 'package:flutter/material.dart';
import 'package:pets/src/modules/feed/widgets/post_card/image_card.dart';
import 'package:pets/src/shared/models/post.dart' as model;
import 'package:pets/src/shared/utils/constants.dart';

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
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: kDefaultPadding / 2,
                horizontal: 15,
              ),
              width: widget.size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.post.days > 1
                            ? '${widget.post.days.toString()} days'
                            : '${widget.post.days.toString()} day',
                        style: textStyle,
                      ),
                    ],
                  ),
                  Text(
                    price.format(widget.post.price),
                    style: textStyle,
                  ),
                ],
              ),
            ),
            ImageCard(size: widget.size, pets: widget.post.pets),
            Container(
              width: widget.size.width,
              padding: const EdgeInsets.symmetric(
                vertical: kDefaultPadding / 2,
                horizontal: 15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    date.format(widget.post.datePublished),
                    style: textStyle,
                  ),
                  Text(
                    widget.post.pets.length > 1
                        ? '${widget.post.pets.length.toString()} Pets'
                        : '${widget.post.pets.length.toString()} Pet',
                    style: textStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
