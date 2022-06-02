import 'package:flutter/material.dart';
import 'package:pets/src/shared/utils/constants.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final Function press;
  const AlreadyHaveAnAccountCheck({Key? key, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Dont´t have an Account?',
        ),
        const Padding(padding: EdgeInsets.only(left: 4)),
        GestureDetector(
          child: const Text(
            'Sign Up',
            style: textStyle,
          ),
          onTap: () {
            press();
          },
        ),
      ],
    );
  }
}
