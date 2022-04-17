import 'package:flutter/material.dart';
import 'package:pets/src/shared/utils/constants.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: kDefaultPadding - 10),
      padding:
          const EdgeInsets.symmetric(vertical: 5, horizontal: kDefaultPadding),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}
