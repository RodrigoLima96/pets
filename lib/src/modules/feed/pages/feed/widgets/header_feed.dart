import 'package:flutter/material.dart';
import 'package:pets/src/shared/utils/constants.dart';

class HeaderFeed extends StatelessWidget {
  const HeaderFeed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.15),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Hi! Olivia',
                style: TextStyle(
                  color: kWhite,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Good Morning!',
                style: TextStyle(color: kPrimaryColor),
              ),
            ],
          ),
          const Spacer(),
          Image.asset(
            'assets/images/logo.png',
            width: 50,
          ),
        ],
      ),
    );
  }
}
