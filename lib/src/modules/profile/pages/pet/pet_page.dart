import 'package:flutter/material.dart';
import 'package:pets/src/models/pet.dart';
import 'package:pets/src/models/post.dart';
import 'package:pets/src/modules/profile/pages/pet/widgets/pet_page_body.dart';
import 'package:pets/src/shared/utils/constants.dart';

class PetPage extends StatelessWidget {
  const PetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Pet pet = Pet(
      petName: 'Mona',
      type: 'dog',
      photoUrl:
          'https://firebasestorage.googleapis.com/v0/b/pets-d0aad.appspot.com/o/pets%2FUuT6Re8vK5PoYL4zMDJoAfjqrAm2%2F374a0e20-db8b-11ec-879d-cb0dd5f4d579?alt=media&token=57e09b84-e6b3-42bb-aca6-aa9c2ffbc95b',
      weight: 111,
      age: 4,
      gender: 'female',
      petId: '1233',
      uid: '12334',
    );

    final List<Post> posts = [
      Post(
        postId: '111',
        uid: 'uid',
        pets: [pet],
        description: 'description',
        datePublished: DateTime.now(),
        username: 'username',
        userPhotoUrl: 'userPhotoUrl',
        petsPhotosUrl: [
          'https://firebasestorage.googleapis.com/v0/b/pets-d0aad.appspot.com/o/pets%2FUuT6Re8vK5PoYL4zMDJoAfjqrAm2%2F374a0e20-db8b-11ec-879d-cb0dd5f4d579?alt=media&token=57e09b84-e6b3-42bb-aca6-aa9c2ffbc95b',
          'https://firebasestorage.googleapis.com/v0/b/pets-d0aad.appspot.com/o/pets%2FUuT6Re8vK5PoYL4zMDJoAfjqrAm2%2F2a290e90-e80f-11ec-adf2-2d94e7725e5d?alt=media&token=7a621578-5ba9-4b59-b176-da780bcb37fd',
        ],
        type: 'dog',
      ),
      Post(
        postId: '111',
        uid: 'uid',
        pets: [pet],
        description: 'description',
        datePublished: DateTime.now(),
        username: 'username',
        userPhotoUrl: 'userPhotoUrl',
        petsPhotosUrl: [
          'https://firebasestorage.googleapis.com/v0/b/pets-d0aad.appspot.com/o/pets%2F6F3InOGrt9O3oHIuB4xoEx2ml8J2%2Fa2dd6430-eb4d-11ec-86eb-bfd84b70c486?alt=media&token=c375534c-a0c2-4f77-b336-26c83cb1230b'
        ],
        type: 'dog',
      ),
    ];

    return Scaffold(
      backgroundColor: kBlack,
      appBar: AppBar(
        backgroundColor: kBlack,
      ),
      body: PetPageBody(pet: pet, posts: posts),
    );
  }
}
