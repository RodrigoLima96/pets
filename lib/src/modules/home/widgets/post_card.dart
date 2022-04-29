import 'package:flutter/material.dart';
import 'package:pets/src/shared/utils/constants.dart';

class PostCard extends StatelessWidget {
  final Size size;
  const PostCard({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Mona',
                    style: textStyle,
                  ),
                  Text(
                    '3 days',
                    style: textStyle,
                  ),
                ],
              ),
              const Text(
                '\$50,00',
                style: textStyle,
              ),
            ],
          ),
        ),
        Container(
          height: size.height * 0.3,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: Image.network(
            'https://images.unsplash.com/photo-1554456854-55a089fd4cb2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                '4 Years',
                style: textStyle,
              ),
              Text(
                '77 Pounds',
                style: textStyle,
              ),
              Text(
                'Female',
                style: textStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
