import 'package:flutter/material.dart';
import 'package:pets/src/modules/auth/signup/controller/sign_up_controller.dart';
import 'package:pets/src/shared/utils/constants.dart';
import 'package:pets/src/shared/widgets/rounded_button.dart';
import 'package:provider/provider.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    Key? key,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.nameController,
    required this.size,
    required this.formKey,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController nameController;
  final Size size;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<SignUpController>();
    return controller.state == AuthState.loading
        ? SizedBox(
            height: size.height * 0.09,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          )
        : SizedBox(
            height: size.height * 0.09,
            child: RoundedButton(
              text: 'SIGN UP',
              press: () {
                if (formKey.currentState!.validate()) {
                  controller.signUpUser(
                    email: emailController.text,
                    password: passwordController.text,
                    name: nameController.text,
                    confirmPassword: confirmPasswordController.text,
                  );
                }
              },
              color: kPrimaryColor,
              textColor: kBlack,
              size: size,
            ),
          );
  }
}
