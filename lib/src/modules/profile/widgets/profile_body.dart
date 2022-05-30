import 'package:flutter/material.dart';
import 'package:pets/src/modules/profile/widgets/reviews/caretaker_reviews.dart';
import 'package:pets/src/modules/profile/widgets/list_name.dart';
import 'package:pets/src/modules/profile/widgets/pets_list.dart';
import 'package:pets/src/modules/profile/widgets/settings_and_notification.dart';
import 'package:pets/src/shared/models/pet.dart';
import 'package:pets/src/shared/models/user.dart';
import 'package:pets/src/shared/widgets/user_info.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user = User(
      uid: 'swswsws',
      name: 'Rodrigo Lima',
      email: 'roswsws',
      photoUrl:
          'https://lh3.googleusercontent.com/a-/AOh14Gg0MIEyf9UUz1SVZ90cerGjaISKr8ktcMPCORv-WA=s288-p-rw-no',
      rating: 9.0,
    );

    List<Pet> pets = [
      Pet(
        petName: 'Mona',
        type: 'dog',
        photoUrl:
            'https://firebasestorage.googleapis.com/v0/b/pets-d0aad.appspot.com/o/pets%2FUuT6Re8vK5PoYL4zMDJoAfjqrAm2%2F374a0e20-db8b-11ec-879d-cb0dd5f4d579?alt=media&token=57e09b84-e6b3-42bb-aca6-aa9c2ffbc95b',
        weight: 90.0,
        age: 3,
        gender: 'female',
        petId: 'wdwsws',
        uid: 'ededed',
      ),
      Pet(
        petName: 'Goiaba',
        type: 'cat',
        photoUrl:
            'https://firebasestorage.googleapis.com/v0/b/pets-d0aad.appspot.com/o/pets%2FETGmciEocAYAbNYLbCypny8cBZH2%2F297bb400-db8c-11ec-874e-b162c64de58c?alt=media&token=3180dfd7-da24-4232-b699-13f29653fe4b',
        weight: 20.0,
        age: 4,
        gender: 'male',
        petId: 'wssws',
        uid: 'wswsws',
      ),
    ];

    List<Pet> caretakerList = [
      Pet(
        petName: 'Mario',
        type: 'dog',
        photoUrl:
            'https://firebasestorage.googleapis.com/v0/b/pets-d0aad.appspot.com/o/pets%2FUuT6Re8vK5PoYL4zMDJoAfjqrAm2%2F374a0e20-db8b-11ec-879d-cb0dd5f4d579?alt=media&token=57e09b84-e6b3-42bb-aca6-aa9c2ffbc95b',
        weight: 90.0,
        age: 3,
        gender: 'female',
        petId: 'wdwsws',
        uid: 'ededed',
      ),
      Pet(
        petName: 'Jambo',
        type: 'cat',
        photoUrl:
            'https://firebasestorage.googleapis.com/v0/b/pets-d0aad.appspot.com/o/pets%2FETGmciEocAYAbNYLbCypny8cBZH2%2F297bb400-db8c-11ec-874e-b162c64de58c?alt=media&token=3180dfd7-da24-4232-b699-13f29653fe4b',
        weight: 20.0,
        age: 4,
        gender: 'male',
        petId: 'wssws',
        uid: 'wswsws',
      ),
      Pet(
        petName: 'Cajú',
        type: 'dog',
        photoUrl:
            'https://firebasestorage.googleapis.com/v0/b/pets-d0aad.appspot.com/o/pets%2FUuT6Re8vK5PoYL4zMDJoAfjqrAm2%2F374a0e20-db8b-11ec-879d-cb0dd5f4d579?alt=media&token=57e09b84-e6b3-42bb-aca6-aa9c2ffbc95b',
        weight: 90.0,
        age: 3,
        gender: 'female',
        petId: 'wdwsws',
        uid: 'ededed',
      ),
      Pet(
        petName: 'Mona',
        type: 'cat',
        photoUrl:
            'https://firebasestorage.googleapis.com/v0/b/pets-d0aad.appspot.com/o/pets%2FETGmciEocAYAbNYLbCypny8cBZH2%2F297bb400-db8c-11ec-874e-b162c64de58c?alt=media&token=3180dfd7-da24-4232-b699-13f29653fe4b',
        weight: 20.0,
        age: 4,
        gender: 'male',
        petId: 'wssws',
        uid: 'wswsws',
      ),
    ];

    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        height: size.height,
        width: double.infinity,
        padding: EdgeInsets.only(top: size.height * 0.05),
        child: Column(
          children: [
            Stack(
              children: [
                const SettingsAndNotifications(notifications: 3),
                UserInfo(
                  userPhoto: user.photoUrl!,
                  username: user.name,
                  rating: user.rating,
                  imageSize: 60,
                ),
              ],
            ),
            ListName(name: 'PETS', size: size),
            PetsList(size: size, pets: pets),
            ListName(name: 'CARETAKER', size: size),
            PetsList(size: size, pets: caretakerList),
            const CaretakerReviews(),
          ],
        ),
      ),
    );
  }
}
