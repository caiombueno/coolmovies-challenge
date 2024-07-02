import 'package:coolmovies/src/models/models.dart';
import 'package:equatable/equatable.dart';
import 'dart:math' as math;

class MovieSummary extends Equatable {
  final MovieID id;
  final String? title, imgUrl;
  final double overallRating;

  const MovieSummary({
    required this.id,
    this.title,
    this.imgUrl,
    this.overallRating = 0,
  });

  factory MovieSummary.fromRatingList({
    required String id,
    String? title,
    String? imgUrl,
    required List<double> ratingList,
  }) {
    final overallRating = ratingList.mean ?? 0;
    final overallRatingRounded = overallRating.roundToDecimalPlaces(1);
    return MovieSummary(
      id: id,
      title: title,
      imgUrl: imgUrl,
      overallRating: overallRatingRounded,
    );
  }

  @override
  List<Object?> get props => [id, title, imgUrl, overallRating];
}

extension on Iterable<double> {
  double? get mean {
    if (isEmpty) return null;

    return reduce((a, b) => a + b) / length;
  }
}

extension on double {
  double roundToDecimalPlaces(int decimalPlaces) {
    final mod = math.pow(10, decimalPlaces);
    return ((this * mod).round() / mod);
  }
}
