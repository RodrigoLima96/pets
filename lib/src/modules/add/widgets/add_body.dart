import 'package:flutter/material.dart';
import 'package:pets/src/modules/add/widgets/go_add_pet.dart';
import 'package:pets/src/modules/add/widgets/header_post.dart';
import 'package:pets/src/shared/utils/constants.dart';

class AddBody extends StatelessWidget {
  const AddBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      padding: EdgeInsets.only(top: size.height * 0.1),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const GoAddPet(),
            SizedBox(height: size.height * 0.1),
            HeaderPost(size: size),
            SizedBox(height: size.height * 0.05),
            Container(
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
            ),
          ],
        ),
      ),
    );
  }
}
