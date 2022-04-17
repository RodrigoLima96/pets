import 'package:flutter/material.dart';
import 'package:pets/src/shared/utils/constants.dart';

class OrDivider extends StatelessWidget {
  final Size size;
  const OrDivider({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
      width: size.width * 0.8,
      child: Row(
        children: [
          buildDivider(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Text(
              'OR',
              style: TextStyle(color: kWhite, fontWeight: FontWeight.bold),
            ),
          ),
          buildDivider(),
        ],
      ),
    );
  }

  Expanded buildDivider() {
    return const Expanded(
      child: Divider(
        color: kPrimaryColor,
      ),
    );
  }
}
