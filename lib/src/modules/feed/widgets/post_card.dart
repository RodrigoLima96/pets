import 'package:flutter/material.dart';
import 'package:pets/src/shared/models/post.dart' as model;
import 'package:pets/src/shared/utils/constants.dart';

class PostCard extends StatelessWidget {
  final Size size;
  final model.Post post;
  const PostCard({Key? key, required this.size, required this.post})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.pets[0].petName,
                    style: textStyle,
                  ),
                  Text(
                    post.days > 1
                        ? '${post.days.toString()} days'
                        : '${post.days.toString()} day',
                    style: textStyle,
                  ),
                ],
              ),
              Text(
                price.format(post.price),
                style: textStyle,
              ),
            ],
          ),
        ),
        Container(
          height: size.height * 0.3,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: Image.network(
            post.pets[0].photoUrl,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                date.format(post.datePublished),
                style: textStyle,
              ),
              Text(
                '${post.pets[0].weight.toString()} Pounds',
                style: textStyle,
              ),
              Text(
                post.pets[0].gender,
                style: textStyle,
              ),
            ],
          ),
        ),
        SizedBox(height: size.height * 0.05),
      ],
    );
  }
}
