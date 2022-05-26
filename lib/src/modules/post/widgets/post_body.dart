import 'package:flutter/material.dart';
import 'package:pets/src/modules/add/addPost/controllers/add_post_validator_controller.dart';
import 'package:pets/src/modules/post/widgets/post_info.dart';
import 'package:pets/src/modules/post/widgets/user_info.dart';
import 'package:pets/src/shared/models/post.dart';
import 'package:pets/src/shared/utils/constants.dart';
import 'package:pets/src/shared/widgets/input_description.dart';
import 'package:pets/src/shared/widgets/list_images.dart';
import 'package:pets/src/shared/widgets/rounded_button.dart';
import 'package:provider/provider.dart';

class PostBody extends StatelessWidget {
  final Post post;
  const PostBody({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var descriptionController = TextEditingController();
    final _validadorController = context.read<AddPostValidatorController>();

    Size size = MediaQuery.of(context).size;
    const double rating = 9.3;

    return SizedBox(
      height: size.height,
      width: size.width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListImages(pets: post.pets, size: size),
            PostInfo(days: post.days, postPrice: post.price),
            UserInfo(
              userPhoto: post.userPhotoUrl,
              username: post.username,
              rating: rating,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                post.description,
                style: textStyle,
                textAlign: TextAlign.justify,
              ),
            ),
            InputDescription(
              size: size,
              descriptionController: descriptionController,
              validadorController: _validadorController,
              padding: size.height * 0.03,
            ),
            RoundedButton(
              text: 'APPLY',
              press: () {},
              color: kPrimaryColor,
              textColor: kWhite,
              size: size,
            ),
          ],
        ),
      ),
    );
  }
}
