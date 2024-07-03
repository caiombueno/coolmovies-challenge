import 'package:coolmovies/src/models/models.dart';
import 'package:equatable/equatable.dart';

class MovieReviewList extends Equatable {
  final String movieId;
  final List<MovieReview> reviews;

  const MovieReviewList({
    required this.movieId,
    this.reviews = const [],
  });

  @override
  List<Object?> get props => [movieId, reviews];
}
