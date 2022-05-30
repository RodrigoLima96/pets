import 'package:flutter/material.dart';
import 'package:pets/src/shared/utils/constants.dart';

class ListName extends StatelessWidget {
  final Size size;
  final String name;
  const ListName({Key? key, required this.size, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: size.height * 0.05, bottom: kDefaultPadding),
      child: Text(name, style: textStyle),
    );
  }
}
