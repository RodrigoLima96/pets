import 'package:flutter/material.dart';
import 'package:pets/src/modules/post/widgets/list_test.dart';
import 'package:pets/src/shared/utils/constants.dart';

class PostBody extends StatelessWidget {
  const PostBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final List<String> images = [
      'https://firebasestorage.googleapis.com/v0/b/pets-d0aad.appspot.com/o/pets%2FUuT6Re8vK5PoYL4zMDJoAfjqrAm2%2F374a0e20-db8b-11ec-879d-cb0dd5f4d579?alt=media&token=57e09b84-e6b3-42bb-aca6-aa9c2ffbc95b',
      'https://firebasestorage.googleapis.com/v0/b/pets-d0aad.appspot.com/o/pets%2FUuT6Re8vK5PoYL4zMDJoAfjqrAm2%2F85e7edd0-dc95-11ec-904b-1b91b317ec0d?alt=media&token=188ff642-af69-4901-86ff-459dc21da5d1',
    ];
    final List<String> nomes = [
      'Mona',
      'Boiaba',
    ];
    return Container(
      height: size.height,
      width: size.width,
      padding: EdgeInsets.only(top: size.height * 0.1),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListTeste(
              images: images,
              nomes: nomes,
              size: size,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: kDefaultPadding, horizontal: kDefaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '3 days',
                    style: textStyle.copyWith(fontSize: 20),
                  ),
                  Text(
                    price.format(60),
                    style: textStyle.copyWith(fontSize: 20),
                  ),
                ],
              ),
            ),
            Column(
              children: const [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                    'https://lh3.googleusercontent.com/a-/AOh14Gg0MIEyf9UUz1SVZ90cerGjaISKr8ktcMPCORv-WA=s288-p-rw-no',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text('Rodrigo Lima', style: textStyle),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
