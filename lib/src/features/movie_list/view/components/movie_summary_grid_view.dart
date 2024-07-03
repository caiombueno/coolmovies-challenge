import 'package:coolmovies/src/features/movie_list/view/components/components.dart';
import 'package:coolmovies/src/models/models.dart';
import 'package:flutter/material.dart';

class MovieSummaryGridView extends StatelessWidget {
  const MovieSummaryGridView(this.movieSummaryList, {super.key});
  final List<MovieSummary> movieSummaryList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: movieSummaryList.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
        childAspectRatio: 1 / 2,
      ),
      itemBuilder: (_, index) {
        final movie = movieSummaryList[index];
        return MovieSummaryGridTile(movie);
      },
    );
  }
}
