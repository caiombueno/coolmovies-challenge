import 'package:coolmovies/src/constants/app_sizes.dart';
import 'package:coolmovies/src/features/commons/components/exception_failure_indicator.dart';
import 'package:coolmovies/src/features/movie_reviews/state_management/state_management.dart';
import 'package:coolmovies/src/features/movie_reviews/view/components/components.dart';
import 'package:coolmovies/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieReviewSliverList extends StatelessWidget {
  const MovieReviewSliverList({
    super.key,
    this.padding,
  });
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieReviewRetrieverCubit, MovieReviewRetrieverState>(
        builder: (context, state) {
      if (state is MovieReviewsRetrieverFailed) {
        return SliverToBoxAdapter(
            child: _MovieReviewsRetrieverFailedIndicator(state.exception));
      } else if (state is MovieReviewsRetrieverLoaded) {
        final reviews = state.reviewList.reviews;
        return SliverList.separated(
          itemBuilder: ((_, index) => Padding(
                padding: padding ?? const EdgeInsets.all(0),
                child: MovieReviewTile(reviews[index]),
              )),
          itemCount: reviews.length,
          separatorBuilder: (_, __) => const Divider(),
        );
      } else {
        return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()));
      }
    });
  }
}

class _MovieReviewsRetrieverFailedIndicator extends StatelessWidget {
  const _MovieReviewsRetrieverFailedIndicator(this.exception);
  final DomainException exception;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.p16),
      child: ExceptionFailureIndicator(exception),
    );
  }
}
