import 'package:coolmovies/src/features/movie_list/view/view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
part 'app_router.g.dart';

final router = GoRouter(
  initialLocation: const HomeRoute().location,
  debugLogDiagnostics: true,
  routes: $appRoutes,
);

@TypedGoRoute<HomeRoute>(path: '/')
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomeScreen();
}
