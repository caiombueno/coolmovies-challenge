import 'package:coolmovies/src/features/movie_reviews/view/components/components.dart';
import 'package:coolmovies/src/l10n/l10n.dart';
import 'package:coolmovies/src/models/models.dart';
import 'package:flutter/material.dart';

class AddReviewButton extends StatelessWidget {
  const AddReviewButton(
      {super.key, required this.movieId, this.onReviewCreated});
  final MovieID movieId;
  final void Function()? onReviewCreated;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          useRootNavigator: true,
          context: context,
          builder: (_) => AddReviewDialog(
            movieId: movieId,
            onReviewCreated: onReviewCreated,
          ),
        );
      },
      child: Text(context.l10n.addReviewButtonLabel),
    );
  }
}
