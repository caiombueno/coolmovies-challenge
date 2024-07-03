import 'package:coolmovies/src/data/data.dart';
import 'package:coolmovies/src/features/commons/components/exception_failure_indicator.dart';
import 'package:coolmovies/src/features/movie_details/state_management/state_management.dart';
import 'package:coolmovies/src/features/movie_details/view/components/components.dart';
import 'package:coolmovies/src/features/movie_reviews/state_management/state_management.dart';
import 'package:coolmovies/src/service_location/service_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen(this.movieId, {super.key});
  final String movieId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieDetailsCubit>(
          create: (_) => MovieDetailsCubit(serviceLocator<MovieRepository>())
            ..getMovieDetails(movieId: movieId),
        ),
        BlocProvider<MovieReviewRetrieverCubit>(
          create: (_) =>
              MovieReviewRetrieverCubit(serviceLocator<MovieRepository>())
                ..getMovieReviews(movieId: movieId),
        ),
      ],
      child: const MovieDetailsView(),
    );
  }
}

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
        body: Center(
          child: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
              builder: (_, state) {
            if (state is MovieDetailsLoaded) {
              return MovieDetailsContentView(state.movieDetails);
            } else if (state is MovieDetailsFailed) {
              return ExceptionFailureIndicator(state.exception);
            } else {
              return const CircularProgressIndicator();
            }
          }),
        ),
      ),
    );
  }
}
