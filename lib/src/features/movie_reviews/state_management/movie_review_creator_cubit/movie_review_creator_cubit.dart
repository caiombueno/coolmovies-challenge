import 'package:coolmovies/src/data/data.dart';
import 'package:coolmovies/src/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movie_review_creator_state.dart';

class MovieReviewCreatorCubit extends Cubit<MovieReviewCreatorState> {
  final MovieRepository _movieRepository;
  MovieReviewCreatorCubit(this._movieRepository)
      : super(const MovieReviewCreatorInitial());

  Future<void> createMovieReview({
    required MovieID movieId,
    required String title,
    String? body,
    int? rating,
  }) async {
    emit(const MovieReviewCreatorLoading());
    final result = await _movieRepository.createMovieReview(
      movieId: movieId,
      title: title,
      body: body,
      rating: rating,
    );

    emit(result.fold(
      (exception) => MovieReviewCreatorFailed(exception),
      (_) => const MovieReviewCreatorLoaded(),
    ));
  }
}
