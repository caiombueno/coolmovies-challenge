import 'package:coolmovies/src/models/models.dart';
import 'package:equatable/equatable.dart';

typedef ReviewID = String;

class MovieReview extends Equatable {
  final ReviewID reviewId;
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
