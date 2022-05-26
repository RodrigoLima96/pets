import 'package:flutter/material.dart';
import 'package:pets/src/shared/utils/constants.dart';

class PostInfo extends StatelessWidget {
  final int days;
  final double postPrice;

  const PostInfo({
    Key? key,
    required this.days,
    required this.postPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: kDefaultPadding, horizontal: kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${days.toString()} days',
            style: textStyle.copyWith(fontSize: 20),
          ),
          Text(
            price.format(postPrice),
            style: textStyle.copyWith(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
