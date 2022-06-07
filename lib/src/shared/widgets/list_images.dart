import 'package:flutter/material.dart';
import 'package:pets/src/models/pet.dart';
import 'package:pets/src/shared/utils/constants.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ListImages extends StatefulWidget {
  final List<Pet> pets;
  final Size size;

  const ListImages({Key? key, required this.pets, required this.size})
      : super(key: key);

  @override
  State<ListImages> createState() => _ListImageState();
}

class _ListImageState extends State<ListImages> {
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
