import 'package:coolmovies/src/features/movie_reviews/view/components/rating_bar.dart';
import 'package:coolmovies/src/models/models.dart';
import 'package:flutter/material.dart';

class MovieReviewTile extends StatelessWidget {
  const MovieReviewTile(this.review, {super.key});
  final MovieReview review;

  @override
  Widget build(BuildContext context) {
    final title = review.title;
    final reviewBody = review.body;
    final reviewerName = review.reviewer?.name;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            (title != null)
                ? Text(title, style: Theme.of(context).textTheme.titleMedium)
                : const SizedBox.shrink(),
            RatingBar(review.rating ?? 0.0),
          ],
        ),
        if (reviewBody != null)
          Text(reviewBody, style: Theme.of(context).textTheme.bodyMedium),
        if (reviewerName != null) _ReviewerIndicator(reviewerName),
      ],
    );
  }
}

class _ReviewerIndicator extends StatelessWidget {
  const _ReviewerIndicator(this.reviewerName);
  final String reviewerName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox.shrink(),
        Text('by $reviewerName'),
      ],
    );
  }
}
