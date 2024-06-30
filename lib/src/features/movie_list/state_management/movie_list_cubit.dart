import 'package:coolmovies/src/data/data.dart';
import 'package:coolmovies/src/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'movie_list_state.dart';

class MovieListCubit extends Cubit<MovieListState> {
  final MovieRepository _movieRepository;

  MovieListCubit(this._movieRepository) : super(const MovieListLoading());

  Future<void> getMovieSummaryList() async {
    final movies = await _movieRepository.getMovieSummaryList();
    emit(
      movies.fold(
        (exception) => MovieListFailed(exception),
        (summaries) => MovieListLoaded(summaries),
      ),
    );
  }
}
