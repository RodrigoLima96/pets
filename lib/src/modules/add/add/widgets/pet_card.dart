import 'package:flutter/material.dart';
import 'package:pets/src/shared/utils/constants.dart';

class PetCard extends StatelessWidget {
  const PetCard({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.15,
      width: size.width * 0.8,
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      decoration: BoxDecoration(
        border: Border.all(
          color: kPrimaryColor,
          width: 1.5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
                'https://firebasestorage.googleapis.com/v0/b/pets-d0aad.appspot.com/o/posts%2FUuT6Re8vK5PoYL4zMDJoAfjqrAm2%2Fangel-luciano-LATYeZyw88c-unsplash%20(1).jpg?alt=media&token=274a1604-e6ef-4cf1-ba03-73f11fe66634'),
          ),
          const Padding(
            padding: EdgeInsets.only(left: kDefaultPadding),
            child: Text(
              'Mona',
              style: textStyle,
            ),
          ),
          const Spacer(),
          Container(
              height: 18,
              width: 18,
              decoration: BoxDecoration(
                border: Border.all(
                  color: kPrimaryColor,
                  width: 2,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              )),
        ],
      ),
    );
  }
}
