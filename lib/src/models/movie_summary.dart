import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'movie_summary.g.dart';

@JsonSerializable()
class MovieSummary extends Equatable {
  final String id;
  final String? title, imgUrl, releaseDate;

  const MovieSummary({
    required this.id,
    this.title,
    this.imgUrl,
    this.releaseDate,
  });

  factory MovieSummary.fromJson(Map<String, dynamic> json) =>
      _$MovieSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$MovieSummaryToJson(this);

  @override
  List<String?> get props => [id, title, imgUrl, releaseDate];
}
