class Review {
  final String reviewId;
  final String caretakerId;
  final String uid;
  final String userPhotoUrl;
  final String name;
  final DateTime reviewDate;
  final double rating;
  final String review;

  Review({
    required this.reviewId,
    required this.caretakerId,
    required this.uid,
    required this.userPhotoUrl,
    required this.name,
    required this.reviewDate,
    required this.rating,
    required this.review,
  });
}
