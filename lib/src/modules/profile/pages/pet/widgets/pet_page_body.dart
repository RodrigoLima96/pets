import 'package:flutter/material.dart';
import 'package:pets/src/models/pet.dart';
import 'package:pets/src/models/post.dart';
import 'package:pets/src/modules/profile/pages/pet/widgets/pet_info.dart';
import 'package:pets/src/modules/profile/pages/pet/widgets/pet_posts.dart';
import 'package:pets/src/shared/utils/constants.dart';
import 'package:pets/src/shared/widgets/list_images.dart';

class PetPageBody extends StatelessWidget {
  final Pet pet;
  final List<Post> posts;
  const PetPageBody({Key? key, required this.pet, required this.posts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListImages(listLength: 1, size: size, images: [pet.photoUrl]),
            SizedBox(height: size.height * 0.05),
            Text(pet.petName, style: textStyle),
            SizedBox(height: size.height * 0.01),
            PetInfo(pet: pet),
            SizedBox(height: size.height * 0.05),
            PetPosts(posts: posts, size: size),
          ],
        ),
      ),
    );
  }
}
