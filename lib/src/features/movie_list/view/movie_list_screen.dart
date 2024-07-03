import 'package:coolmovies/src/data/data.dart';
import 'package:coolmovies/src/features/commons/components/exception_failure_indicator.dart';
import 'package:coolmovies/src/features/movie_list/state_management/state_management.dart';
import 'package:coolmovies/src/features/movie_list/view/components/components.dart';
import 'package:coolmovies/src/l10n/l10n.dart';
import 'package:coolmovies/src/service_location/service_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieListScreen extends StatelessWidget {
  const MovieListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieListCubit>(
      create: (_) => MovieListCubit(serviceLocator<MovieRepository>())
        ..getMovieSummaryList(),
      child: const MovieListView(),
    );
  }
}

class MovieListView extends StatelessWidget {
  const MovieListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.appName)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Center(child: BlocBuilder<MovieListCubit, MovieListState>(
            builder: ((context, state) {
              if (state is MovieListLoaded) {
                return MovieSummaryGridView(state.movies);
              } else if (state is MovieListFailed) {
                return ExceptionFailureIndicator(state.exception);
              } else {
                return const CircularProgressIndicator();
              }
            }),
          )),
        ),
      ),
    );
  }
}
