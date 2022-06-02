import 'package:flutter/material.dart';
import 'package:pets/src/shared/utils/constants.dart';

class BoxText extends StatelessWidget {
  const BoxText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(5),
      height: 30,
      decoration: BoxDecoration(
        color: Colors.grey,
        border: Border.all(
          width: 2,
          color: kPrimaryColor,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Center(
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}
