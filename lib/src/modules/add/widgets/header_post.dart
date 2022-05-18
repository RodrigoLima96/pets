import 'package:flutter/material.dart';
import 'package:pets/src/shared/utils/constants.dart';

class HeaderPost extends StatelessWidget {
  const HeaderPost({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.8,
      child: Row(
        children: [
          Text(
            '1',
            style: textStyle.copyWith(fontSize: 20),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {},
            child: Text(
              'POST',
              style: textStyle.copyWith(color: Colors.blueAccent),
            ),
          ),
        ],
      ),
    );
  }
}
