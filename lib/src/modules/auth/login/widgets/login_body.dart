import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pets/src/shared/utils/constants.dart';
import 'package:pets/src/modules/auth/login/widgets/already_have_an_account_check.dart';
import 'package:pets/src/modules/auth/signup/sign_up_page.dart';
import 'package:pets/src/shared/widgets/logo.dart';
import 'package:pets/src/shared/widgets/rounded_button.dart';
import 'package:pets/src/shared/widgets/rounded_input_password.dart';
import 'package:pets/src/shared/widgets/rounded_input_text.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    Size size = MediaQuery.of(context).size;

    signUpPage() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const SignUpPage()));
    }

    @override
    // ignore: unused_element
    void dispose() {
      super.dispose();
      emailController.dispose();
      passwordController.dispose();
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
              controller: emailController,
              hintText: 'Email',
              icon: SvgPicture.asset(
                'assets/icons/email.svg',
                color: kPrimaryColor,
              ),
              validator: (value) {
                if (value!.length < 3) {
                  return 'Tá loco?';
                }
                return null;
              },
            ),
            RoundedInputPassword(
              controller: passwordController,
              confirmPassword: false,
              validator: (value) {
                return null;
              },
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
