import 'package:coolmovies/src/data/data.dart';
import 'package:coolmovies/src/models/models.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class MovieRepository {
  final MovieDataSource _movieDataSource;
  const MovieRepository(this._movieDataSource);

  Future<Either<DataException, List<MovieSummary>>>
      getMovieSummaryList() async {
    final result = await _movieDataSource.getMovieSummaryList();
    return result.fold(
      (exception) {
        DataException dataException;

        if (exception is EmptyResultException) {
          dataException = const NoMovieSummaryListFoundException();
        } else {
          dataException = const MovieSummaryListFetchFailureException();
        }

        return Left(dataException);
      },
      (summaries) => Right(summaries),
    );
  }

  Future<Either<DataException, MovieDetails>> getMovieDetails(
      {required String movieId}) async {
    final result = await _movieDataSource.getMovieDetails(movieId: movieId);
    return result.fold(
      (exception) {
        DataException dataException;

        if (exception is EmptyResultException) {
          dataException = const NoMovieDetailsFoundException();
        } else {
          dataException = const MovieDetailsFetchFailureException();
        }

        return Left(dataException);
      },
      (movieDetails) => Right(movieDetails),
    );
  }

  Future<Either<DataException, MovieReviewList>> getMovieReviews(
      {required String movieId}) async {
    final result = await _movieDataSource.getMovieReviews(movieId: movieId);

    return result.fold(
      (exception) {
        DataException dataException;

        if (exception is EmptyResultException) {
          dataException = const NoMovieReviewsFoundException();
        } else {
          dataException = const MovieReviewsFetchFailureException();
        }

        return Left(dataException);
      },
      (reviews) => Right(reviews),
    );
  }
    );
  }
}
