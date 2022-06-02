import 'package:flutter/material.dart';
import 'package:pets/src/modules/feed/pages/feed/widgets/post_card/box_text.dart';
import 'package:pets/src/shared/utils/constants.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ListTeste extends StatefulWidget {
  final List<String> images;
  final Size size;
  final List<String> nomes;

  const ListTeste(
      {Key? key, required this.images, required this.size, required this.nomes})
      : super(key: key);

  @override
  State<ListTeste> createState() => _ListImageState();
}

class _ListImageState extends State<ListTeste> {
  int indexImage = 1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size.height * 0.3,
      width: widget.size.width,
      child: Stack(
        children: [
          ListView.builder(
            itemCount: widget.images.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return VisibilityDetector(
                key: Key(index.toString()),
                onVisibilityChanged: (VisibilityInfo info) {
                  if (info.visibleFraction == 1) {
                    setState(() {
                      if (index == 0) {
                        indexImage = 1;
                      } else if (indexImage < widget.images.length) {
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
                        widget.images[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      children: [
                        BoxText(text: widget.nomes[index]),
                        BoxText(text: widget.nomes[index]),
                        BoxText(text: widget.nomes[index]),
                        BoxText(text: widget.nomes[index]),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
          widget.images.length > 1
              ? Positioned(
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '$indexImage/${widget.images.length}',
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
