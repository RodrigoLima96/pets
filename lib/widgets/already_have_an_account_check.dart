import 'package:flutter/material.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccountCheck(
      {Key? key, required this.login, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? 'Dont´t have an Account?' : 'Already have an Account?',
        ),
        const Padding(padding: EdgeInsets.only(left: 4)),
        GestureDetector(
          child: Text(
            login ? 'Sign Up' : 'Sign In',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          onTap: () {
            press();
          },
        ),
      ],
    );
  }
}
