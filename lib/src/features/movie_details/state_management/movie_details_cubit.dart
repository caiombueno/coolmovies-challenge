import 'package:coolmovies/src/data/data.dart';
import 'package:coolmovies/src/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final MovieRepository _movieRepository;
  MovieDetailsCubit(this._movieRepository) : super(const MovieDetailsLoading());

  Future<void> getMovieDetails({required String movieId}) async {
    final movieDetails =
        await _movieRepository.getMovieDetails(movieId: movieId);
    emit(
      movieDetails.fold(
        (exception) => MovieDetailsFailed(exception),
        (details) => MovieDetailsLoaded(details),
      ),
    );
  }
}
