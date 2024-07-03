import 'package:coolmovies/src/constants/app_sizes.dart';
import 'package:coolmovies/src/data/data.dart';
import 'package:coolmovies/src/features/commons/components/exception_failure_indicator.dart';
import 'package:coolmovies/src/features/movie_reviews/state_management/state_management.dart';
import 'package:coolmovies/src/features/movie_reviews/view/components/movie_review_form.dart';
import 'package:coolmovies/src/l10n/l10n.dart';
import 'package:coolmovies/src/models/models.dart';
import 'package:coolmovies/src/service_location/service_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddReviewDialog extends StatelessWidget {
  const AddReviewDialog(
      {super.key, required this.movieId, this.onReviewCreated});
  final MovieID movieId;
  final void Function()? onReviewCreated;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieReviewCreatorCubit>(
      create: (_) => MovieReviewCreatorCubit(serviceLocator<MovieRepository>()),
      child: AddReviewDialogView(
          movieId: movieId, onReviewCreated: onReviewCreated),
    );
  }
}

class AddReviewDialogView extends StatelessWidget {
  const AddReviewDialogView(
      {super.key, required this.movieId, this.onReviewCreated});
  final MovieID movieId;
  final void Function()? onReviewCreated;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(Sizes.p16),
        child: _AddReviewDialogContent(
          movieId: movieId,
          onReviewCreated: onReviewCreated,
        ),
      ),
    );
  }
}

class _AddReviewDialogContent extends StatelessWidget {
  const _AddReviewDialogContent({
    required this.movieId,
    void Function()? onReviewCreated,
  }) : _onReviewCreated = onReviewCreated;
  final MovieID movieId;
  final void Function()? _onReviewCreated;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieReviewCreatorCubit, MovieReviewCreatorState>(
      listenWhen: (previous, current) => current is MovieReviewCreatorLoaded,
      listener: (context, state) {
        if (state is! MovieReviewCreatorLoaded) return;
        final onReviewCreated = _onReviewCreated;
        if (onReviewCreated != null) onReviewCreated();
      },
      builder: (context, state) {
        if (state is MovieReviewCreatorInitial) {
          return MovieReviewForm(
              onSubmit: (title, body, rating) =>
                  context.read<MovieReviewCreatorCubit>().createMovieReview(
                        title: title,
                        body: body,
                        rating: rating,
                        movieId: movieId,
                      ));
        } else if (state is MovieReviewCreatorLoaded) {
          return const _MovieReviewCreatorLoadedIndicator();
        } else if (state is MovieReviewCreatorFailed) {
          return ExceptionFailureIndicator(state.exception);
        } else {
          return const FittedBox(
              fit: BoxFit.scaleDown, child: CircularProgressIndicator());
        }
      },
    );
  }
}

class _MovieReviewCreatorLoadedIndicator extends StatelessWidget {
  const _MovieReviewCreatorLoadedIndicator();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.check_circle, color: Colors.green, size: 50),
        gapH8,
        Text(context.l10n.movieReviewCreationSuccessMessage),
      ],
    );
  }
}
