import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pets/constants.dart';
import 'package:pets/widgets/rounded_button.dart';
import '../../login/login_page.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    loginPage() {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const LoginPage()));
    }

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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/logo.png',
                width: size.width * 0.2,
              ),
              SizedBox(height: size.height * 0.02),
              const Text(
                'WELCOME TO PETS',
                style: TextStyle(
                  color: kWhite,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.height * 0.1),
              RoundedButton(
                text: 'LOGIN',
                press: () => loginPage(),
                color: kPrimaryColor,
                textColor: kWhite,
              ),
              RoundedButton(
                text: 'SIGNUP',
                press: () {},
                color: kPrimaryColor,
                textColor: Colors.black,
              ),
              SizedBox(height: size.height * 0.2)
            ],
          ),
        ],
      ),
    );
  }
}
