import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pets/constants.dart';
import 'package:pets/pages/login/widgets/already_have_an_account_check.dart';
import 'package:pets/pages/signup/sign_up_page.dart';
import 'package:pets/widgets/logo.dart';
import 'package:pets/widgets/rounded_button.dart';
import 'package:pets/widgets/rounded_input_password.dart';
import 'package:pets/widgets/rounded_input_text.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    signUpPage() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const SignUpPage()));
    }

    return Container(
      padding: EdgeInsets.only(top: size.height * 0.15),
      height: size.height,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Logo(login: true, size: size),
            SizedBox(height: size.height * 0.1),
            RoundedInputText(
              hintText: 'Email',
              icon: SvgPicture.asset(
                'assets/icons/email.svg',
                color: kPrimaryColor,
              ),
            ),
            const RoundedInputPassword(
              confirmPassword: false,
            ),
            SizedBox(height: size.height * 0.01),
            RoundedButton(
              text: 'LOGIN',
              press: () {},
              color: kPrimaryColor,
              textColor: kWhite,
              size: size,
            ),
            SizedBox(height: size.height * 0.25),
            AlreadyHaveAnAccountCheck(press: () => signUpPage()),
          ],
        ),
      ),
    );
  }
}
