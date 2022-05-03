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
                    post.pet.petName,
                    style: textStyle,
                  ),
                  Text(
                    '${post.days.toString()} days',
                    style: textStyle,
                  ),
                ],
              ),
              Text(
                '\$ ${post.price.toString()}',
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
            post.pet.photoUrl,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${post.days.toString()} days',
                style: textStyle,
              ),
              Text(
                '${post.pet.weight.toString()} Pounds',
                style: textStyle,
              ),
              Text(
                post.pet.gender,
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
