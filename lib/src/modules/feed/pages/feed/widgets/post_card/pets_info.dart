import 'package:flutter/material.dart';
import 'package:pets/src/models/pet.dart';
import 'package:pets/src/shared/utils/constants.dart';

class PetsInfo extends StatefulWidget {
  final List<Pet> pets;
  final Size size;
  final double imageRadius;

  const PetsInfo({
    Key? key,
    required this.pets,
    required this.size,
    required this.imageRadius,
  }) : super(key: key);

  @override
  State<PetsInfo> createState() => _ListImageState();
}

class _ListImageState extends State<PetsInfo> {
  int indexImage = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50,
          width: widget.size.width,
          padding: const EdgeInsets.only(left: 10),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.pets.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      child: CircleAvatar(
                        radius: widget.imageRadius,
                        backgroundImage: NetworkImage(
                          widget.pets[index].photoUrl,
                        ),
                      ),
                    ),
                    Text(widget.pets[index].petName, style: textStyle),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
