import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pets/src/shared/utils/constants.dart';

class EditPetPhoto extends StatelessWidget {
  final Size size;
  final String photo;
  const EditPetPhoto({Key? key, required this.size, required this.photo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.28,
      child: Stack(
        children: [
          Container(
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
                    image: NetworkImage(photo),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -5,
            right: 60,
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/edit.svg',
                color: kPrimaryColor,
                width: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
}
