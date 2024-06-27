// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieSummary _$MovieSummaryFromJson(Map<String, dynamic> json) => MovieSummary(
      id: json['id'] as String,
      title: json['title'] as String?,
      imgUrl: json['imgUrl'] as String?,
      releaseDate: json['releaseDate'] as String?,
    );

Map<String, dynamic> _$MovieSummaryToJson(MovieSummary instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'imgUrl': instance.imgUrl,
      'releaseDate': instance.releaseDate,
    };
