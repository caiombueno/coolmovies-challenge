import 'package:coolmovies/src/constants/app_sizes.dart';
import 'package:coolmovies/src/data/data.dart';
import 'package:coolmovies/src/features/movie_list/state_management/state_management.dart';
import 'package:coolmovies/src/features/movie_list/view/components/movie_list_loaded/movie_list_loaded.dart';
import 'package:coolmovies/src/l10n/l10n.dart';
import 'package:coolmovies/src/models/models.dart';
import 'package:coolmovies/src/service_location/service_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieListScreen extends StatelessWidget {
  const MovieListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieListCubit>(
      create: (_) => MovieListCubit(serviceLocator.get<MovieRepository>())
        ..getMovieSummaryList(),
      child: const _MovieListScreen(),
    );
  }
}

class _MovieListScreen extends StatelessWidget {
  const _MovieListScreen();

  @override
  Widget build(BuildContext context) {
    final blocBuilder =
        BlocBuilder<MovieListCubit, MovieListState>(builder: ((context, state) {
      if (state is MovieListLoaded) {
        return MovieListLoadedView(state.movies);
      } else if (state is MovieListFailed) {
        return _MovieListFailedWidget(state.exception);
      } else {
        return const CircularProgressIndicator();
      }
    }));

    return Scaffold(
      appBar: const _MovieListScreenAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
        child: Center(child: blocBuilder),
      ),
    );
  }
}

class _MovieListScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _MovieListScreenAppBar();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text(context.l10n.appName));
  }
}

class _MovieListFailedWidget extends StatelessWidget {
  const _MovieListFailedWidget(this.exception);
  final DomainException exception;

  @override
  Widget build(BuildContext context) {
    return Text(exception.getMessage(context));
  }
}
