import 'package:flutter/material.dart';
import 'package:pets/src/modules/add/addPost/widgets/pets.dart';

class PetsListPost extends StatelessWidget {
  final Size size;
  const PetsListPost({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> pets = ['1', '2'];
    return Container(
      height: size.height * 0.1,
      width: double.infinity,
      margin: EdgeInsets.only(top: size.height * 0.05),
      child: Center(
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int i) {
            return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Pets(
                  photo:
                      'https://firebasestorage.googleapis.com/v0/b/pets-d0aad.appspot.com/o/posts%2FUuT6Re8vK5PoYL4zMDJoAfjqrAm2%2Fangel-luciano-LATYeZyw88c-unsplash%20(1).jpg?alt=media&token=274a1604-e6ef-4cf1-ba03-73f11fe66634',
                  name: 'Mona',
                ));
          },
          itemCount: pets.length,
        ),
      ),
    );
  }
}
