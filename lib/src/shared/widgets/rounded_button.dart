import 'package:flutter/material.dart';
import 'package:pets/src/shared/utils/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  final Size size;

  const RoundedButton(
      {Key? key,
      required this.text,
      required this.press,
      required this.color,
      required this.textColor,
      required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.8,
      margin: const EdgeInsets.symmetric(vertical: kDefaultPadding - 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: TextButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.resolveWith((states) =>
                const EdgeInsets.symmetric(vertical: kDefaultPadding)),
            backgroundColor:
                MaterialStateProperty.resolveWith((states) => color),
          ),
          onPressed: () {
            press();
          },
          child: Text(
            text,
            style: textStyle.copyWith(color: textColor),
          ),
        ),
      ),
    );
  }
}
