import 'package:flutter/material.dart';
import 'package:pets/src/modules/feed/controllers/post_controller.dart';
import 'package:pets/src/shared/utils/constants.dart';
import 'package:provider/provider.dart';

class Description extends StatelessWidget {
  const Description({
    Key? key,
    required this.description,
  }) : super(key: key);

  final String description;

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<PostController>();
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Text(
        controller.newDescription == null
            ? description
            : controller.newDescription!,
        style: textStyle,
        textAlign: TextAlign.justify,
      ),
    );
  }
}
