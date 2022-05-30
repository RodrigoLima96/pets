import 'package:flutter/material.dart';
import 'package:pets/src/modules/profile/widgets/reviews/review_card.dart';
import 'package:pets/src/shared/utils/constants.dart';

class CaretakerReviews extends StatelessWidget {
  const CaretakerReviews({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 2,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(bottom: kDefaultPadding),
            child: ReviewCard(
              avatar:
                  'https://lh3.googleusercontent.com/a-/AOh14Gg0MIEyf9UUz1SVZ90cerGjaISKr8ktcMPCORv-WA=s288-p-rw-no',
              name: 'Rodrigo Lima',
              date: '13 mins ago',
              rating: 9.2,
              review:
                  'Best caretaker ever!!! I always look for him to take care of my dog!',
            ),
          );
        },
      ),
    );
  }
}
