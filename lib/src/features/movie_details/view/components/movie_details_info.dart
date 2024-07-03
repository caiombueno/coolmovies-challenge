import 'package:coolmovies/src/constants/app_sizes.dart';
import 'package:coolmovies/src/features/movie_details/view/components/movie_details_movie_image.dart';
import 'package:coolmovies/src/l10n/l10n.dart';
import 'package:coolmovies/src/models/models.dart';
import 'package:flutter/material.dart';

class MovieDetailsInfo extends StatelessWidget {
  const MovieDetailsInfo(this.movieDetails, {super.key, this.infoPadding});

  final MovieDetails movieDetails;
  final EdgeInsetsGeometry? infoPadding;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MovieDetailsMovieImage(
          imageUrl: movieDetails.imgUrl,
          gradientColor: Theme.of(context).colorScheme.background,
        ),
        Padding(
          padding: infoPadding ?? const EdgeInsets.all(0),
          child: _MovieInfoDetails(
            title: movieDetails.title,
            releaseDate: movieDetails.formattedReleaseDate,
            directorName: movieDetails.director?.name,
          ),
        )
      ],
    );
  }
}

class _MovieInfoDetails extends StatelessWidget {
  const _MovieInfoDetails({this.title, this.releaseDate, this.directorName});
  final String? title, releaseDate, directorName;

  @override
  Widget build(BuildContext context) {
    final titleStr = title;

    final releaseDateStr = releaseDate;

    final directorNameStr = directorName;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (titleStr != null) ...[
          Text(titleStr, style: Theme.of(context).textTheme.titleLarge),
          gapH12,
        ],
        if (releaseDateStr != null)
          Text(
            context.l10n.releaseDateIndicator(releaseDateStr),
            style: Theme.of(context).textTheme.titleSmall,
          ),
        if (directorNameStr != null)
          Text(
            context.l10n.directorNameIndicator(directorNameStr),
            style: Theme.of(context).textTheme.titleSmall,
          ),
      ],
    );
  }
}
