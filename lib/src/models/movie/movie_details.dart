import 'package:coolmovies/src/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class MovieDetails extends Equatable {
  final MovieID movieId;
  final String? title, imgUrl, releaseDate;
  final MovieDirector? director;

  const MovieDetails({
    required this.movieId,
    this.title,
    this.imgUrl,
    this.releaseDate,
    this.director,
  });

  String? get formattedReleaseDate => (releaseDate != null)
      ? DateFormat('MMMM d, y').format(DateTime.parse(releaseDate!))
      : null;

  @override
  List<Object?> get props => [movieId, title, imgUrl, releaseDate, director];
}
