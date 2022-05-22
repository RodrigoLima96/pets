import 'package:flutter/material.dart';
import 'package:pets/src/modules/add/addPost/widgets/pets_list_post.dart';
import 'package:pets/src/shared/utils/constants.dart';

class AddPostBody extends StatelessWidget {
  const AddPostBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: double.infinity,
      padding: EdgeInsets.only(top: size.height * 0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PetsListPost(size: size),
          const Text(
            '2 Pets',
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
