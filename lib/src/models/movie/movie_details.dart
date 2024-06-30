import 'package:coolmovies/src/models/models.dart';
import 'package:equatable/equatable.dart';

class MovieDetails extends Equatable {
  final String movieId;
  final String? title, imgUrl, releaseDate;
  final List<MovieReview> reviews;
  final MovieDirector? director;

  const MovieDetails({
    required this.movieId,
    this.title,
    this.imgUrl,
    this.releaseDate,
    this.director,
    this.reviews = const [],
  });

  @override
  List<Object?> get props =>
      [movieId, title, imgUrl, releaseDate, director, reviews];
}
