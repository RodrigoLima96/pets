import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pets/widgets/rounded_button.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            bottom: -110,
            child: Lottie.asset(
              'assets/animations/login.json',
              width: size.width * 0.8,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/logo2.png',
                  width: size.width * 0.2,
                ),
                SizedBox(height: size.height * 0.01),
                const Text(
                  'Welcome to Pets',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height * 0.1),
                RoundedButton(
                  text: 'LOGIN',
                  press: () {},
                  color: const Color.fromRGBO(202, 215, 185, 1),
                  textColor: Colors.white,
                ),
                RoundedButton(
                  text: 'SIGNUP',
                  press: () {},
                  color: const Color.fromRGBO(202, 215, 185, 1),
                  textColor: Colors.black,
                ),
                SizedBox(height: size.height * 0.2)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
