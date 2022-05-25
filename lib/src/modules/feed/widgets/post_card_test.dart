import 'package:flutter/material.dart';
import 'package:pets/src/modules/feed/widgets/box_text.dart';
import 'package:pets/src/shared/models/pet.dart';
import 'package:pets/src/shared/models/post.dart' as model;
import 'package:pets/src/shared/utils/constants.dart';

class PostCardTest extends StatefulWidget {
  final Size size;
  final model.Post post;
  const PostCardTest({Key? key, required this.size, required this.post})
      : super(key: key);

  @override
  State<PostCardTest> createState() => _PostCardTestState();
}

class _PostCardTestState extends State<PostCardTest> {
  @override
  Widget build(BuildContext context) {
    final List<Pet> pets = widget.post.pets;
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
            SizedBox(
              height: widget.size.height * 0.3,
              width: widget.size.width,
              child: ListView.builder(
                itemCount: pets.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      SizedBox(
                        height: widget.size.height * 0.3,
                        width: widget.size.width,
                        child: Image.network(
                          widget.post.pets[index].photoUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      BoxText(text: widget.post.pets[index].petName),
                    ],
                  );
                },
              ),
            ),
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
                    pets.length > 1
                        ? '${pets.length.toString()} Pets'
                        : '${pets.length.toString()} Pet',
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
