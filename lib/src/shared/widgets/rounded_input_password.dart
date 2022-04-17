import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pets/src/shared/utils/constants.dart';
import 'package:pets/src/shared/widgets/text_field_container.dart';

class RoundedInputPassword extends StatefulWidget {
  final TextEditingController controller;
  final bool confirmPassword;
  final FormFieldValidator<String> validator;

  const RoundedInputPassword({
    Key? key,
    required this.confirmPassword,
    required this.controller,
    required this.validator,
  }) : super(key: key);

  @override
  State<RoundedInputPassword> createState() => _RoundedInputPasswordState();
}

class _RoundedInputPasswordState extends State<RoundedInputPassword> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: Container(
        alignment: Alignment.center,
        child: TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          style: const TextStyle(color: kBlack),
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: !widget.confirmPassword ? 'Password' : 'Confirm Password',
            contentPadding: const EdgeInsets.only(top: 17),
            hintStyle: const TextStyle(color: kBlack),
            icon: SvgPicture.asset(
              'assets/icons/lock.svg',
              color: kPrimaryColor,
            ),
            suffixIcon: IconButton(
              icon: SvgPicture.asset(
                height: 25,
                'assets/icons/eye.svg',
                color: kPrimaryColor,
              ),
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
