part of 'movie_details_cubit.dart';

abstract class MovieDetailsState extends Equatable {
  const MovieDetailsState();
}

class MovieDetailsLoading extends MovieDetailsState {
  const MovieDetailsLoading();

  @override
  List<Object> get props => [];
}

class MovieDetailsLoaded extends MovieDetailsState {
  final MovieDetails movieDetails;

  const MovieDetailsLoaded(this.movieDetails);

  @override
  List<Object> get props => [movieDetails];
}

class MovieDetailsFailed extends MovieDetailsState {
  final DomainException exception;

  const MovieDetailsFailed(this.exception);

  @override
  List<Object> get props => [exception];
}
