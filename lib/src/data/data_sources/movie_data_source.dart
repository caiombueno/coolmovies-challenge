import 'dart:io';
import 'package:coolmovies/src/data/data.dart';
import 'package:coolmovies/src/data/data_sources/data_sources.dart';
import 'package:coolmovies/src/models/models.dart';
import 'package:fpdart/fpdart.dart';
import 'package:graphql/client.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class MovieDataSource {
  late final GraphQLClient _client;

  MovieDataSource() {
    final httpLink = HttpLink(
      Platform.isAndroid
          ? 'http://10.0.2.2:5001/graphql'
          : 'http://localhost:5001/graphql',
    );
    _client = GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(store: InMemoryStore()),
    );
  }

  // This is only used for testing purposes.
  // Injectable will try to inject a GraphQLClient singleton if parameters are used in the constructor.
  MovieDataSource.forTesting(GraphQLClient client) : _client = client;

  Future<Either<Exception, List<MovieSummary>>> getMovieSummaryList() async {
    try {
      final result = await _client
          .query$GetMovieSummaryList(Options$Query$GetMovieSummaryList())
          .onError(
              (_, __) => throw const ServerCommunicationFailureException());

      if (result.hasException) {
        throw const ServerCommunicationFailureException();
      }

      final data = result.data;

      if (data == null || data.isEmpty) throw const EmptyResultException();

      final movieSummaries = _MovieDataSourceParser.parseMovieSummaryList(data);

      return movieSummaries.fold(
        (exception) => throw exception,
        (summaries) => Either.right(summaries),
      );
    } on DataException catch (e) {
      return Either.left(e);
    } catch (e) {
      return Either.left(Exception(e.toString()));
    }
  }

  Future<Either<Exception, MovieDetails>> getMovieDetails(
      {required MovieID movieId}) async {
    try {
      final result = await _client
          .query$GetMovieDetails(
            Options$Query$GetMovieDetails(
                variables: Variables$Query$GetMovieDetails(id: movieId)),
          )
          .onError(
              (_, __) => throw const ServerCommunicationFailureException());

      if (result.hasException) {
        throw const ServerCommunicationFailureException();
      }

      final data = result.data;

      if (data == null || data.isEmpty) throw const EmptyResultException();

      final movieDetails = _MovieDataSourceParser.parseMovieDetails(data);

      return movieDetails.fold(
        (exception) => throw exception,
        (movieDetails) => Either.right(movieDetails),
      );
    } on DataException catch (e) {
      return Either.left(e);
    } catch (e) {
      return Either.left(Exception(e.toString()));
    }
  }

  Future<Either<Exception, MovieReviewList>> getMovieReviews(
      {required MovieID movieId}) async {
    try {
      final result = await _client
          .query$GetMovieReviews(
            Options$Query$GetMovieReviews(
                fetchPolicy: FetchPolicy.networkOnly,
                variables: Variables$Query$GetMovieReviews(movieId: movieId)),
          )
          .onError(
              (_, __) => throw const ServerCommunicationFailureException());

      if (result.hasException) {
        throw const ServerCommunicationFailureException();
      }

      final data = result.data;

      if (data == null || data.isEmpty) throw const EmptyResultException();

      final reviewList = _MovieDataSourceParser.parseMovieReviews(data);

      return reviewList.fold(
        (exception) => throw exception,
        (reviewList) => Either.right(reviewList),
      );
    } on DataException catch (e) {
      return Either.left(e);
    } catch (e) {
      return Either.left(Exception(e.toString()));
    }
  }

  Future<Either<Exception, String>> _getCurrentUserId() async {
    try {
      final result = await _client.query$GetCurrentUser().onError(
          (_, __) => throw const ServerCommunicationFailureException());

      if (result.hasException) {
        throw const ServerCommunicationFailureException();
      }

      final data = result.data;

      if (data == null || data.isEmpty) throw const EmptyResultException();

      final currentUser = _MovieDataSourceParser.parseCurrentUserId(data);

      return currentUser.fold(
        (exception) => throw exception,
        (currentUser) => Either.right(currentUser),
      );
    } on DataException catch (e) {
      return Either.left(e);
    } catch (e) {
      return Either.left(Exception(e.toString()));
    }
  }

  Future<Either<Exception, Unit>> createMovieReview({
    required MovieID movieId,
    required String title,
    String? body,
    int? rating,
  }) async {
    try {
      final userReviewerId =
          await _getCurrentUserId().then((value) => value.fold(
                (Exception exception) => throw exception,
                (id) => id,
              ));

      final result = await _client
          .mutate$CreateMovieReview(
            Options$Mutation$CreateMovieReview(
              variables: Variables$Mutation$CreateMovieReview(
                movieId: movieId,
                userReviewerId: userReviewerId,
                title: title,
                body: body,
                rating: rating,
              ),
            ),
          )
          .onError(
              (_, __) => throw const ServerCommunicationFailureException());

      if (result.hasException) {
        throw const ServerCommunicationFailureException();
      }

      final data = result.data;

      if (data == null || data.isEmpty) throw const EmptyResultException();

      return Either.right(unit);
    } on DataException catch (e) {
      return Either.left(e);
    } catch (e) {
      return Either.left(Exception(e.toString()));
    }
  }
}

class _MovieDataSourceParser {
  static Either<DataFormatFailureException, String> parseCurrentUserId(
      Map<String, dynamic> data) {
    return Either.tryCatch(
      () {
        final parsedData = Query$GetCurrentUser.fromJson(data).currentUser;
        if (parsedData == null) throw const DataFormatFailureException();

        return parsedData.id;
      },
      (_, __) => const DataFormatFailureException(),
    );
  }

  static Either<DataFormatFailureException, MovieReviewList> parseMovieReviews(
      Map<String, dynamic> data) {
    return Either.tryCatch(
      () {
        final parsedData = Query$GetMovieReviews.fromJson(data).movieById;
        if (parsedData == null) throw const DataFormatFailureException();
        final movieId = parsedData.id;

        final reviews = parsedData.movieReviewsByMovieId?.nodes.map((e) {
              final reviewer = e.userByUserReviewerId;
              final reviewerId = reviewer?.id;
              return MovieReview(
                reviewId: e.id,
                title: e.title,
                body: e.body,
                rating: e.rating,
                reviewer: (reviewerId != null)
                    ? User(userId: reviewerId, name: reviewer?.name)
                    : null,
              );
            }).toList() ??
            [];

        return MovieReviewList(movieId: movieId, reviews: reviews);
      },
      (_, __) => const DataFormatFailureException(),
    );
  }

  static Either<DataFormatFailureException, List<MovieSummary>>
      parseMovieSummaryList(Map<String, dynamic> data) {
    return Either.tryCatch(
      () {
        final parsedData = Query$GetMovieSummaryList.fromJson(data);

        final List<MovieSummary> movieSummaries =
            parsedData.allMovies.nodes.map((e) {
          final ratingList =
              _getRatingListFromMovieSummaryList(e.movieReviewsByMovieId);

          return MovieSummary.fromRatingList(
            id: e.id,
            title: e.title,
            imgUrl: e.imgUrl,
            ratingList: ratingList,
          );
        }).toList();

        return movieSummaries;
      },
      (_, __) => const DataFormatFailureException(),
    );
  }

  static Either<DataFormatFailureException, MovieDetails> parseMovieDetails(
      Map<String, dynamic> data) {
    return Either.tryCatch(
      () {
        final parsedData = Query$GetMovieDetails.fromJson(data).movieById;
        if (parsedData == null) throw const DataFormatFailureException();

        final directorData = parsedData.movieDirectorByMovieDirectorId;
        final directorId = directorData?.id;
        final director = (directorId != null)
            ? MovieDirector(directorId: directorId, name: directorData?.name)
            : null;

        final MovieDetails movieDetails = MovieDetails(
          movieId: parsedData.id,
          title: parsedData.title,
          imgUrl: parsedData.imgUrl,
          releaseDate: parsedData.releaseDate,
          director: director,
        );

        return movieDetails;
      },
      (_, __) => const DataFormatFailureException(),
    );
  }

  static List<double> _getRatingListFromMovieSummaryList(
      Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId?
          ratingList) {
    if (ratingList == null) return [];
    final nodes = ratingList.nodes;

    final List<double> ratings =
        nodes.map((e) => e.rating).toNonNullable().toList();

    return ratings;
  }
}

extension NonNullableIterable<E> on Iterable<E?> {
  Iterable<E> toNonNullable() {
    return where((element) => element != null).cast<E>();
  }
}
