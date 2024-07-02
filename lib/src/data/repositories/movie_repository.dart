import 'package:coolmovies/src/data/data.dart';
import 'package:coolmovies/src/models/models.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class MovieRepository {
  final MovieDataSource _movieDataSource;
  const MovieRepository(this._movieDataSource);

  Future<Either<DomainException, List<MovieSummary>>>
      getMovieSummaryList() async {
    final result = await _movieDataSource.getMovieSummaryList();
    return result.fold(
      (exception) {
        DomainException domainException;

        if (exception is EmptyResultException) {
          domainException = const NoMovieSummaryListFoundException();
        } else {
          domainException = const MovieSummaryListFetchFailureException();
        }

        return Left(domainException);
      },
      (summaries) => Right(summaries),
    );
  }

  Future<Either<DomainException, MovieDetails>> getMovieDetails(
      {required MovieID movieId}) async {
    final result = await _movieDataSource.getMovieDetails(movieId: movieId);
    return result.fold(
      (exception) {
        DomainException domainException;

        if (exception is EmptyResultException) {
          domainException = const NoMovieDetailsFoundException();
        } else {
          domainException = const MovieDetailsFetchFailureException();
        }

        return Left(domainException);
      },
      (movieDetails) => Right(movieDetails),
    );
  }

  Future<Either<DomainException, MovieReviewList>> getMovieReviews(
      {required MovieID movieId}) async {
    final result = await _movieDataSource.getMovieReviews(movieId: movieId);

    return result.fold(
      (exception) {
        DomainException domainException;

        if (exception is EmptyResultException) {
          domainException = const NoMovieReviewsFoundException();
        } else {
          domainException = const MovieReviewsFetchFailureException();
        }

        return Left(domainException);
      },
      (reviews) => Right(reviews),
    );
  }

  Future<Either<DomainException, Unit>> createMovieReview({
    required MovieID movieId,
    required String title,
    String? body,
    int? rating,
  }) async {
    final result = await _movieDataSource.createMovieReview(
      movieId: movieId,
      title: title,
      body: body,
      rating: rating,
    );

    return result.fold(
      (_) => const Left(MovieReviewCreationFailureException()),
      (unit) => Right(unit),
    );
  }
}
