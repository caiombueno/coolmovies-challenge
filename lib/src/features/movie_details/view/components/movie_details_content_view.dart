import 'package:coolmovies/src/constants/app_sizes.dart';
import 'package:coolmovies/src/features/movie_details/view/components/movie_details_info.dart';
import 'package:coolmovies/src/features/movie_reviews/state_management/state_management.dart';
import 'package:coolmovies/src/features/movie_reviews/view/view.dart';
import 'package:coolmovies/src/l10n/l10n.dart';
import 'package:coolmovies/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailsContentView extends StatelessWidget {
  const MovieDetailsContentView(this.movieDetails, {super.key});
  final MovieDetails movieDetails;

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.symmetric(horizontal: Sizes.p16);

    return CustomScrollView(
      slivers: [
        SliverList.list(
          children: [
            MovieDetailsInfo(movieDetails, infoPadding: padding),
            gapH12,
            const Divider(),
            gapH12,
            _ReviewsSectionHeader(
                movieId: movieDetails.movieId, padding: padding),
            gapH12,
          ],
        ),
        const MovieReviewSliverList(padding: padding),
      ],
    );
  }
}

class _ReviewsSectionHeader extends StatelessWidget {
  const _ReviewsSectionHeader({required this.movieId, required this.padding});
  final MovieID movieId;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final reviewsSectionTitle = Text(
      context.l10n.reviewsSectionTitle,
      style: Theme.of(context).textTheme.titleLarge,
    );
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          reviewsSectionTitle,
          gapH12,
          AddReviewButton(
            movieId: movieId,
            onReviewCreated: () => context
                .read<MovieReviewRetrieverCubit>()
                .getMovieReviews(movieId: movieId, forceRefresh: true),
          ),
        ],
      ),
    );
  }
}
