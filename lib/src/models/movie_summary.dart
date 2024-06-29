import 'package:equatable/equatable.dart';

class MovieSummary extends Equatable {
  final String id;
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
    return MovieSummary(
      id: id,
      title: title,
      imgUrl: imgUrl,
      overallRating: overallRating,
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
