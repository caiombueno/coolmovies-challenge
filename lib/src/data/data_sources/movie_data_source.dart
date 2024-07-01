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
    } on AppException catch (e) {
      return Either.left(e);
    } catch (e) {
      return Either.left(Exception(e.toString()));
    }
  }

  Future<Either<Exception, MovieDetails>> getMovieDetails(
      {required String movieId}) async {
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
    } on AppException catch (e) {
      return Either.left(e);
    } catch (e) {
      return Either.left(Exception(e.toString()));
    }
  }

  Future<Either<Exception, MovieReviewList>> getMovieReviews(
      {required String movieId}) async {
    try {
      final result = await _client
          .query$GetMovieReviews(
            Options$Query$GetMovieReviews(
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
    } on AppException catch (e) {
      return Either.left(e);
    } catch (e) {
      return Either.left(Exception(e.toString()));
    }
  }

  Future<Either<Exception, User>> getCurrentUser() async {
    try {
      final result = await _client.query$GetCurrentUser().onError(
          (_, __) => throw const ServerCommunicationFailureException());

      if (result.hasException) {
        throw const ServerCommunicationFailureException();
      }

      final data = result.data;

      if (data == null || data.isEmpty) throw const EmptyResultException();

      final currentUser = _MovieDataSourceParser.parseCurrentUser(data);

      return currentUser.fold(
        (exception) => throw exception,
        (currentUser) => Either.right(currentUser),
      );
    } on AppException catch (e) {
      return Either.left(e);
    } catch (e) {
      return Either.left(Exception(e.toString()));
    }
  }

  Future<Either<Exception, MovieReview>> createMovieReview({
    required String movieId,
    required String userReviewerId,
    required String title,
    String? body,
    int? rating,
  }) async {
    try {
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

      final createdMovieReview =
          _MovieDataSourceParser.parseCreatedMovieReview(data);

      return createdMovieReview.fold(
        (exception) => throw exception,
        (movieReview) => Either.right(movieReview),
      );
    } on AppException catch (e) {
      return Either.left(e);
    } catch (e) {
      return Either.left(Exception(e.toString()));
    }
  }
}

class _MovieDataSourceParser {
  static Either<DataFormatFailureException, MovieReview>
      parseCreatedMovieReview(Map<String, dynamic> data) {
    return Either.tryCatch(
      () {
        final parsedData = Mutation$CreateMovieReview.fromJson(data)
            .createMovieReview
            ?.movieReview;

        final parsedReviewerData = parsedData?.userByUserReviewerId;
        if (parsedData == null || parsedReviewerData == null) {
          throw const DataFormatFailureException();
        }

        final reviewer = User(
          userId: parsedReviewerData.id,
          name: parsedReviewerData.name,
        );

        final movieReview = MovieReview(
          reviewId: parsedData.id,
          title: parsedData.title,
          body: parsedData.body,
          rating: parsedData.rating,
          reviewer: reviewer,
        );

        return movieReview;
      },
      (_, __) => const DataFormatFailureException(),
    );
  }

  static Either<DataFormatFailureException, User> parseCurrentUser(
      Map<String, dynamic> data) {
    return Either.tryCatch(
      () {
        final parsedData = Query$GetCurrentUser.fromJson(data).currentUser;
        if (parsedData == null) throw const DataFormatFailureException();

        final currentUser = User(
          userId: parsedData.id,
          name: parsedData.name,
        );

        return currentUser;
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

        final reviews = _getMovieReviewListFromMovieDetails(
            parsedData.movieReviewsByMovieId);

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
          reviews: reviews,
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

  static List<MovieReview> _getMovieReviewListFromMovieDetails(
      Query$GetMovieDetails$movieById$movieReviewsByMovieId? reviewList) {
    if (reviewList == null) return [];

    final reviews = reviewList.nodes.map((e) {
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
    }).toList();

    return reviews;
  }
}

extension NonNullableIterable<E> on Iterable<E?> {
  Iterable<E> toNonNullable() {
    return where((element) => element != null).cast<E>();
  }
}
