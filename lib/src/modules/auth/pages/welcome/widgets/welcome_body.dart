import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pets/src/modules/auth/pages/welcome/widgets/bottom_animation.dart';
import 'package:pets/src/routes/router_utils.dart';
import 'package:pets/src/shared/utils/constants.dart';
import 'package:pets/src/shared/widgets/rounded_button.dart';

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          BottomAnimation(size: size),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/logo.png',
                width: size.width * 0.2,
              ),
              SizedBox(height: size.height * 0.02),
              const Text('WELCOME TO PETS', style: textStyle),
              SizedBox(height: size.height * 0.1),
              RoundedButton(
                text: 'LOGIN',
                press: () => context.pushNamed(AppPage.login.toName),
                color: kPrimaryColor,
                textColor: kWhite,
                size: size,
              ),
              RoundedButton(
                text: 'SIGNUP',
                press: () => context.pushNamed(AppPage.singUp.toName),
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
