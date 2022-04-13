import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pets/constants.dart';
import 'package:pets/pages/signup/widgets/or_divider.dart';
import 'package:pets/pages/signup/widgets/social_icon.dart';
import 'package:pets/widgets/logo.dart';
import 'package:pets/widgets/rounded_button.dart';
import 'package:pets/widgets/rounded_input_password.dart';
import 'package:pets/widgets/rounded_input_text.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Logo(login: false, size: size),
            SizedBox(height: size.height * 0.05),
            RoundedInputText(
              hintText: 'Name',
              icon: SvgPicture.asset(
                'assets/icons/person.svg',
                color: kPrimaryColor,
              ),
            ),
            RoundedInputText(
              hintText: 'Email',
              icon: SvgPicture.asset(
                'assets/icons/email.svg',
                color: kPrimaryColor,
              ),
            ),
            const RoundedInputPassword(confirmPassword: false),
            const RoundedInputPassword(confirmPassword: true),
            SizedBox(height: size.height * 0.01),
            RoundedButton(
              text: 'SIGN UP',
              press: () {},
              color: kPrimaryColor,
              textColor: kBlack,
              size: size,
            ),
            SizedBox(height: size.height * 0.05),
            OrDivider(size: size),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialIcon(icon: 'assets/icons/facebook.svg', press: () {}),
                SocialIcon(icon: 'assets/icons/google-plus.svg', press: () {}),
                SocialIcon(icon: 'assets/icons/twitter.svg', press: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
