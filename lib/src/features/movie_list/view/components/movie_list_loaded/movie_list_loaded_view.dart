import 'dart:math';

import 'package:coolmovies/src/features/movie_list/view/components/components.dart';
import 'package:coolmovies/src/models/models.dart';
import 'package:flutter/material.dart';

class MovieListLoadedView extends StatelessWidget {
  const MovieListLoadedView(this.movieSummaryList, {super.key});
  final List<MovieSummary> movieSummaryList;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final moviesLength = movieSummaryList.length;

      final screenHeight = constraints.maxHeight;
      final screenWidth = constraints.maxWidth;

      const aspectRatio = 1 / 2;

      final minTileWidth = screenHeight / 5;
      final crossAxisCount = (screenWidth / minTileWidth).floor();

      final adjustedCrossAxisCount = max(crossAxisCount, 1);

      return GridView.builder(
          shrinkWrap: false,
          itemCount: moviesLength,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: adjustedCrossAxisCount,
            childAspectRatio: aspectRatio,
          ),
          itemBuilder: (_, index) {
            final movie = movieSummaryList[index];
            return MovieSummaryGridTile(key: Key(movie.id), movie);
          });
    });
  }
}
