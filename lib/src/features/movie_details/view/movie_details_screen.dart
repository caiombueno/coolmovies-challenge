import 'package:coolmovies/src/data/repositories/repositories.dart';
import 'package:coolmovies/src/features/movie_details/state_management/state_management.dart';
import 'package:coolmovies/src/features/movie_details/view/components/movie_details_loaded/movie_details_loaded.dart';
import 'package:coolmovies/src/service_location/service_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen(this.movieId, {super.key});
  final String movieId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieDetailsCubit>(
      create: (_) => MovieDetailsCubit(serviceLocator<MovieRepository>())
        ..getMovieDetails(movieId),
      child: const _MovieDetailsScreen(),
    );
  }
}

class _MovieDetailsScreen extends StatelessWidget {
  const _MovieDetailsScreen();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      builder: ((context, state) {
        if (state is MovieDetailsLoaded) {
          return MovieDetailsLoadedView(state.movieDetails);
        } else if (state is MovieDetailsFailed) {
          return Scaffold(
            body: Center(child: Text(state.exception.getMessage(context))),
          );
        } else {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      }),
    );
  }
}
