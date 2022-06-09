import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pets/src/shared/utils/constants.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ListImages extends StatefulWidget {
  final List<String>? images;
  final Size size;
  final List<Uint8List>? files;
  final int listLength;

  const ListImages(
      {Key? key,
      this.images,
      this.files,
      required this.listLength,
      required this.size})
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
            itemCount: widget.listLength,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return VisibilityDetector(
                key: Key(index.toString()),
                onVisibilityChanged: (VisibilityInfo info) {
                  if (info.visibleFraction == 1) {
                    setState(() {
                      if (index == 0) {
                        indexImage = 1;
                      } else if (indexImage < widget.listLength) {
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
                      child: widget.files != null
                          ? Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: MemoryImage(widget.files![index]),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )
                          : Image.network(
                              widget.images![index],
                              fit: BoxFit.cover,
                            ),
                    ),
                  ],
                ),
              );
            },
          ),
          widget.listLength > 1
              ? Positioned(
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '$indexImage/${widget.listLength}',
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
