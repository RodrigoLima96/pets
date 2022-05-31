import 'package:flutter/material.dart';
import 'package:pets/src/modules/profile/profile/widgets/reviews/review_card.dart';
import 'package:pets/src/shared/models/review.dart';
import 'package:pets/src/shared/utils/constants.dart';

class CaretakerReviews extends StatelessWidget {
  final List<Review> reviews;
  const CaretakerReviews({
    Key? key,
    required this.reviews,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: reviews.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: kDefaultPadding),
            child: ReviewCard(
              avatar: reviews[index].userPhotoUrl,
              name: reviews[index].name,
              date: date.format(reviews[index].reviewDate),
              rating: reviews[index].rating,
              review: reviews[index].review,
            ),
          );
        },
      ),
    );
  }
}
