// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $movieListRoute,
      $movieDetailsRoute,
    ];

RouteBase get $movieListRoute => GoRouteData.$route(
      path: '/movie-list',
      factory: $MovieListRouteExtension._fromState,
    );

extension $MovieListRouteExtension on MovieListRoute {
  static MovieListRoute _fromState(GoRouterState state) =>
      const MovieListRoute();

  String get location => GoRouteData.$location(
        '/movie-list',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $movieDetailsRoute => GoRouteData.$route(
      path: '/movie/:movieId',
      factory: $MovieDetailsRouteExtension._fromState,
    );

extension $MovieDetailsRouteExtension on MovieDetailsRoute {
  static MovieDetailsRoute _fromState(GoRouterState state) => MovieDetailsRoute(
        state.pathParameters['movieId']!,
      );

  String get location => GoRouteData.$location(
        '/movie/${Uri.encodeComponent(movieId)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
