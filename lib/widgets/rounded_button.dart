import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;

  const RoundedButton(
      {Key? key,
      required this.text,
      required this.press,
      required this.color,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: TextButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.resolveWith(
                (states) => const EdgeInsets.symmetric(vertical: 20)),
            backgroundColor:
                MaterialStateProperty.resolveWith((states) => color),
          ),
          onPressed: () {},
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
