import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pets/src/shared/utils/constants.dart';

class SettingOption extends StatelessWidget {
  final String text;
  final String icon;
  final Function function;
  const SettingOption({
    Key? key,
    required this.size,
    required this.text,
    required this.icon,
    required this.function,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  icon,
                  color: kPrimaryColor,
                  width: 25,
                ),
                const SizedBox(width: kDefaultPadding),
                Text(
                  text,
                  style: textStyle.copyWith(fontSize: 18),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 3),
              child: Center(
                child: Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: kPrimaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
