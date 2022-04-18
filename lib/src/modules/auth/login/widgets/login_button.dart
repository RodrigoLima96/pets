import 'package:flutter/material.dart';
import 'package:pets/src/modules/auth/login/controller/login_controller.dart';
import 'package:pets/src/shared/utils/constants.dart';
import 'package:pets/src/shared/widgets/rounded_button.dart';
import 'package:provider/provider.dart';

class LoginButton extends StatelessWidget {
  final GlobalKey<FormState> _formKey;
  final Size size;
  final TextEditingController email;
  final TextEditingController password;

  const LoginButton({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.size,
    required this.email,
    required this.password,
  })  : _formKey = formKey,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<LoginController>();
    return controller.state == LoginState.loading
        ? SizedBox(
            height: size.height * 0.09,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          )
        : RoundedButton(
            text: 'LOGIN',
            press: () {
              if (_formKey.currentState!.validate()) {
                controller.loginUser(
                    email: email.text, password: password.text);
              }
            },
            color: kPrimaryColor,
            textColor: kWhite,
            size: size,
          );
  }
}
