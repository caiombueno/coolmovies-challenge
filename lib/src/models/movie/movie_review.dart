import 'package:coolmovies/src/models/models.dart';
import 'package:equatable/equatable.dart';

class MovieReview extends Equatable {
  final String reviewId;
  final String? title, body;
  final double? rating;
  final User? reviewer;

  const MovieReview({
    required this.reviewId,
    this.title,
    this.body,
    this.reviewer,
    this.rating,
  });

  @override
  List<Object?> get props => [reviewId, title, body, reviewer, rating];
}

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
