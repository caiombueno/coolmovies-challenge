import 'package:coolmovies/src/features/commons/views/rating_bar.dart';
import 'package:coolmovies/src/models/models.dart';
import 'package:flutter/material.dart';

class MovieReviewTile extends StatelessWidget {
  const MovieReviewTile(this.review, {super.key});
  final MovieReview review;

  @override
  Widget build(BuildContext context) {
    final titleWidget = Text(review.title ?? 'No title',
        style: Theme.of(context).textTheme.titleMedium);

    final bodyWidget = Text(review.body ?? 'No body',
        style: Theme.of(context).textTheme.bodyMedium);

    final ratingWidget = RatingBar(review.rating ?? 0.0);

    final reviewer = review.reviewer;
    final reviewerNameWidget =
        (reviewer != null) ? ReviewerIndicator(reviewer) : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            titleWidget,
            ratingWidget,
          ],
        ),
        bodyWidget,
        if (reviewerNameWidget != null) reviewerNameWidget,
      ],
    );
  }
}

class ReviewerIndicator extends StatelessWidget {
  const ReviewerIndicator(this.reviewer, {super.key});
  final User reviewer;

  @override
  Widget build(BuildContext context) {
    final reviewerName = reviewer.name ?? 'Unknown';
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox.shrink(),
        Text('by $reviewerName'),
      ],
    );
  }
}
