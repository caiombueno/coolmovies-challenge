import 'dart:math';

import 'package:coolmovies/src/data/repositories/repositories.dart';
import 'package:coolmovies/src/features/movie_list/state_management/state_management.dart';
import 'package:coolmovies/src/features/movie_list/view/components/components.dart';
import 'package:coolmovies/src/models/models.dart';
import 'package:coolmovies/src/service_location/service_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieGridView extends StatelessWidget {
  const MovieGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieListCubit>(
      create: (_) => MovieListCubit(serviceLocator.get<MovieRepository>())
        ..getMovieSummaryList(),
      child: const _MovieListView(),
    );
  }
}

class _MovieListView extends StatelessWidget {
  const _MovieListView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieListCubit, MovieListState>(
        builder: ((context, state) {
      if (state is MovieListLoaded) {
        return _MovieListLoadedWidget(state.movies);
      } else if (state is MovieListFailed) {
        return _MovieListFailedWidget(state.exception);
      } else {
        return const CircularProgressIndicator();
      }
    }));
  }
}

class _MovieListLoadedWidget extends StatelessWidget {
  const _MovieListLoadedWidget(this.movieSummaryList);
  final List<MovieSummary> movieSummaryList;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final moviesLength = movieSummaryList.length;

      final screenHeight = constraints.maxHeight;
      final screenWidth = constraints.maxWidth;

      const aspectRatio = 2 / 4;

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

class _MovieListFailedWidget extends StatelessWidget {
  const _MovieListFailedWidget(this.exception);
  final AppException exception;

  @override
  Widget build(BuildContext context) {
    return Text(exception.getMessage(context));
  }
}
