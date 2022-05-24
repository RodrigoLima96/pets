import 'package:flutter/material.dart';
import 'package:pets/src/shared/models/pet.dart';
import 'package:pets/src/shared/models/post.dart' as model;
import 'package:pets/src/shared/utils/constants.dart';

class PostCardTest extends StatelessWidget {
  final Size size;
  final model.Post post;
  const PostCardTest({Key? key, required this.size, required this.post})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Pet> pets = post.pets;
    return SingleChildScrollView(
      child: SizedBox(
        height: size.height * 0.45,
        width: size.width,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: kDefaultPadding / 2),
              width: size.width,
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
              width: size.width,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  for (int i = 0; i < pets.length; i++)
                    SizedBox(
                      height: size.height * 0.3,
                      width: size.width,
                      child: Image.network(
                        post.pets[i].photoUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                ],
              ),
            ),
            Container(
              width: size.width,
              padding: const EdgeInsets.only(top: kDefaultPadding / 2),
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
          ],
        ),
      ),
    );
  }
}
