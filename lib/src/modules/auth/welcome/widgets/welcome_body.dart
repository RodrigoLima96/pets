import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pets/src/shared/utils/constants.dart';
import 'package:pets/src/modules/auth/login/login_page.dart';
import 'package:pets/src/modules/auth/signup/sign_up_page.dart';
import 'package:pets/src/shared/widgets/rounded_button.dart';

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    loginPage() {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const LoginPage()));
    }

    signUpPage() {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const SignUpPage()));
    }

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
                size: size,
              ),
              RoundedButton(
                text: 'SIGNUP',
                press: () => signUpPage(),
                color: kPrimaryColor,
                textColor: Colors.black,
                size: size,
              ),
              SizedBox(height: size.height * 0.2)
            ],
          ),
        ],
      ),
    );
  }
}
