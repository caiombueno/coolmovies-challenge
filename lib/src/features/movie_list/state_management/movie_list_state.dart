part of 'movie_list_cubit.dart';

abstract class MovieListState extends Equatable {
  const MovieListState();
}

class MovieListLoading extends MovieListState {
  const MovieListLoading();

  @override
  List<Object> get props => [];
}

class MovieListLoaded extends MovieListState {
  final List<MovieSummary> movies;

  const MovieListLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class MovieListFailed extends MovieListState {
  final DomainException exception;

  const MovieListFailed(this.exception);

  @override
  List<Object> get props => [exception];
}
