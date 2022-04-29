import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pets/src/modules/auth/login/controller/login_controller.dart';
import 'package:pets/src/modules/auth/login/controller/login_validator_controller.dart';
import 'package:pets/src/modules/auth/login/widgets/login_button.dart';
import 'package:pets/src/shared/utils/constants.dart';
import 'package:pets/src/modules/auth/login/widgets/already_have_an_account_check.dart';
import 'package:pets/src/shared/utils/methods.dart';
import 'package:pets/src/shared/widgets/logo.dart';
import 'package:pets/src/shared/widgets/rounded_input_password.dart';
import 'package:pets/src/shared/widgets/rounded_input_text.dart';
import 'package:provider/provider.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _validadorController = LoginValidatorController();

  @override
  void initState() {
    super.initState();
    final controller = context.read<LoginController>();

    controller.addListener(
      () {
        if (controller.state == LoginState.error) {
          showSnackBar(context, controller.loginErrorFirebase);
        } else if (controller.state == LoginState.success) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/home', (route) => false);
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  signUpPage() {
    Navigator.of(context).pushNamed('/sign_up');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: size.height * 0.15),
      height: size.height,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Logo(login: true, size: size),
              SizedBox(height: size.height * 0.1),
              RoundedInputText(
                controller: _emailController,
                hintText: 'Email',
                icon: SvgPicture.asset(
                  'assets/icons/email.svg',
                  color: kPrimaryColor,
                ),
                textInputType: TextInputType.emailAddress,
                validator: (value) {
                  return _validadorController.emailValidator(value!);
                },
              ),
              RoundedInputPassword(
                controller: _passwordController,
                confirmPassword: false,
                validator: (value) {
                  return _validadorController.passwordValidator(value!);
                },
              ),
              SizedBox(height: size.height * 0.01),
              LoginButton(
                formKey: _formKey,
                size: size,
                email: _emailController,
                password: _passwordController,
              ),
              SizedBox(height: size.height * 0.25),
              AlreadyHaveAnAccountCheck(press: () => signUpPage()),
            ],
          ),
        ),
      ),
    );
  }
}
