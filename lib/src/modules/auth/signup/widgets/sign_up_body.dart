import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pets/src/modules/auth/signup/controller/sign_up_validador_controller.dart';
import 'package:pets/src/modules/auth/signup/controller/sign_up_controller.dart';
import 'package:pets/src/modules/auth/signup/widgets/sign_up_button.dart';
import 'package:pets/src/modules/home/home_page.dart';
import 'package:pets/src/shared/utils/constants.dart';
import 'package:pets/src/modules/auth/signup/widgets/or_divider.dart';
import 'package:pets/src/modules/auth/signup/widgets/social_icon.dart';
import 'package:pets/src/shared/utils/methods.dart';
import 'package:pets/src/shared/widgets/logo.dart';
import 'package:pets/src/shared/widgets/rounded_input_password.dart';
import 'package:pets/src/shared/widgets/rounded_input_text.dart';
import 'package:provider/provider.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({Key? key}) : super(key: key);

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final validadorController = SignUpValidatorController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    final controller = context.read<SignUpController>();

    controller.addListener(() {
      if (controller.state == SignUpState.error) {
        showSnackBar(context, controller.signUpErrorFirebase);
      } else if (controller.state == SignUpState.success) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const HomePage(),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Logo(login: false, size: size),
              SizedBox(height: size.height * 0.05),
              RoundedInputText(
                controller: nameController,
                hintText: 'Name',
                icon: SvgPicture.asset(
                  'assets/icons/person.svg',
                  color: kPrimaryColor,
                ),
                textInputType: TextInputType.text,
                validator: (value) {
                  return validadorController.nameValidator(value!);
                },
              ),
              RoundedInputText(
                controller: emailController,
                hintText: 'Email',
                icon: SvgPicture.asset(
                  'assets/icons/email.svg',
                  color: kPrimaryColor,
                ),
                textInputType: TextInputType.emailAddress,
                validator: (value) {
                  return validadorController.emailValidator(value!);
                },
              ),
              RoundedInputPassword(
                controller: passwordController,
                confirmPassword: false,
                validator: (value) {
                  return validadorController.passwordValidator(
                      value!, confirmPasswordController.text);
                },
              ),
              RoundedInputPassword(
                controller: confirmPasswordController,
                confirmPassword: true,
                validator: (value) {
                  return validadorController.passwordValidator(
                      value!, passwordController.text);
                },
              ),
              SizedBox(height: size.height * 0.01),
              SignUpButton(
                emailController: emailController,
                passwordController: passwordController,
                nameController: nameController,
                confirmPasswordController: confirmPasswordController,
                size: size,
                formKey: _formKey,
              ),
              SizedBox(height: size.height * 0.05),
              OrDivider(size: size),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialIcon(icon: 'assets/icons/facebook.svg', press: () {}),
                  SocialIcon(
                      icon: 'assets/icons/google-plus.svg', press: () {}),
                  SocialIcon(icon: 'assets/icons/twitter.svg', press: () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
