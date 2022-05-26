import 'package:flutter/material.dart';
import 'package:pets/src/modules/feed/widgets/post_card/box_text.dart';
import 'package:pets/src/shared/models/pet.dart';
import 'package:pets/src/shared/utils/constants.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ImageCard extends StatefulWidget {
  final Size size;
  final List<Pet> pets;
  const ImageCard({Key? key, required this.size, required this.pets})
      : super(key: key);

  @override
  State<ImageCard> createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  int indexImage = 1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size.height * 0.3,
      width: widget.size.width,
      child: Stack(
        children: [
          ListView.builder(
            itemCount: widget.pets.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return VisibilityDetector(
                key: Key(index.toString()),
                onVisibilityChanged: (VisibilityInfo info) {
                  if (info.visibleFraction == 1) {
                    setState(() {
                      if (index == 0) {
                        indexImage = 1;
                      } else if (indexImage < widget.pets.length) {
                        indexImage += index;
                      }
                      debugPrint(indexImage.toString());
                    });
                  }
                },
                child: Stack(
                  children: [
                    SizedBox(
                      height: widget.size.height * 0.3,
                      width: widget.size.width,
                      child: Image.network(
                        widget.pets[index].photoUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    BoxText(text: widget.pets[index].petName),
                  ],
                ),
              );
            },
          ),
          widget.pets.length > 1
              ? Positioned(
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '$indexImage/${widget.pets.length}',
                      style: textStyle,
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
