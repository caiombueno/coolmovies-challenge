import 'package:coolmovies/src/features/movie_details/view/view.dart';
import 'package:coolmovies/src/features/movie_list/view/view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
part 'app_router.g.dart';

final router = GoRouter(
  initialLocation: const HomeRoute().location,
  debugLogDiagnostics: true,
  routes: $appRoutes,
);

@TypedGoRoute<HomeRoute>(
    path: '/',
    routes: [TypedGoRoute<MovieDetailsRoute>(path: 'movie/:movieId')])
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomeScreen();
}

class MovieDetailsRoute extends GoRouteData {
  final String movieId;

  MovieDetailsRoute(this.movieId);

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      MovieDetailsScreen(movieId);
}
