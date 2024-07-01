import 'package:coolmovies/src/features/movie_details/view/view.dart';
import 'package:coolmovies/src/features/movie_list/view/view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
part 'app_router.g.dart';

final router = GoRouter(
  initialLocation: const MovieListRoute().location,
  debugLogDiagnostics: true,
  routes: $appRoutes,
  redirect: (context, state) {
    if (state.uri.path == '/') {
      return const MovieListRoute().location;
    }
    return null;
  },
);

@TypedGoRoute<MovieListRoute>(path: '/movie-list')
class MovieListRoute extends GoRouteData {
  const MovieListRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const MovieListScreen();
}

@TypedGoRoute<MovieDetailsRoute>(path: '/movie/:movieId')
class MovieDetailsRoute extends GoRouteData {
  final String movieId;

  MovieDetailsRoute(this.movieId);

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      MovieDetailsScreen(movieId);
}
