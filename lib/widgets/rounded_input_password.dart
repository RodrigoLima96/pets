import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pets/constants.dart';
import 'package:pets/widgets/text_field_container.dart';

class RoundedInputPassword extends StatelessWidget {
  final bool confirmPassword;
  const RoundedInputPassword({
    Key? key,
    required this.confirmPassword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: Container(
        alignment: Alignment.center,
        child: TextField(
          style: const TextStyle(color: kBlack),
          obscureText: true,
          decoration: InputDecoration(
            hintText: !confirmPassword ? 'Password' : 'Confirm Password',
            hintStyle: const TextStyle(color: kBlack),
            icon: SvgPicture.asset(
              'assets/icons/lock.svg',
              color: kPrimaryColor,
            ),
            suffixIcon: !confirmPassword
                ? SvgPicture.asset(
                    height: 5,
                    'assets/icons/eye.svg',
                    color: kPrimaryColor,
                  )
                : null,
            suffixIconConstraints: const BoxConstraints(
              minHeight: 27,
              minWidth: 27,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
