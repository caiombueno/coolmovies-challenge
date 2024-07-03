import 'package:coolmovies/src/data/data.dart';
import 'package:coolmovies/src/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movie_review_retriever_state.dart';

class MovieReviewRetrieverCubit extends Cubit<MovieReviewRetrieverState> {
  final MovieRepository _movieRepository;
  MovieReviewRetrieverCubit(this._movieRepository)
      : super(const MovieReviewsRetrieverLoading());

  Future<void> getMovieReviews(
      {required String movieId, bool forceRefresh = false}) async {
    final result = await _movieRepository.getMovieReviews(
        movieId: movieId, forceRefresh: forceRefresh);

    emit(result.fold(
      (exception) => MovieReviewsRetrieverFailed(exception),
      (reviews) => MovieReviewsRetrieverLoaded(reviews),
    ));
  }
}
