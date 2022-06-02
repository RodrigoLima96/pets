import 'package:flutter/material.dart';
import 'dart:typed_data';

class PetPhoto extends StatelessWidget {
  final Size size;
  final Uint8List photo;
  const PetPhoto({Key? key, required this.size, required this.photo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.25,
      width: size.width * 0.9,
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: MemoryImage(photo),
                fit: BoxFit.fill,
              ),
            ),
          )),
    );
  }
}
