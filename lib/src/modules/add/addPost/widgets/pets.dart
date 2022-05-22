import 'package:flutter/material.dart';
import 'package:pets/src/shared/utils/constants.dart';

class Pets extends StatelessWidget {
  final String photo;
  final String name;
  const Pets({Key? key, required this.photo, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(
            'https://firebasestorage.googleapis.com/v0/b/pets-d0aad.appspot.com/o/posts%2FUuT6Re8vK5PoYL4zMDJoAfjqrAm2%2Fangel-luciano-LATYeZyw88c-unsplash%20(1).jpg?alt=media&token=274a1604-e6ef-4cf1-ba03-73f11fe66634',
          ),
        ),
        Text(
          'Mona',
          style: textStyle,
        ),
      ],
    );
  }
}
