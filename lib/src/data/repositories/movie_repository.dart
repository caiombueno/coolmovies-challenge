import 'package:coolmovies/src/data/data_sources/data_sources.dart';
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
      (l) {
        DataException exception;

        if (l is EmptyResultException) {
          exception = const NoMovieSummaryListFoundException();
        } else {
          exception = const MovieSummaryListFetchFailureException();
        }

        return Left(exception);
      },
      (r) => Right(r),
    );
  }

  Future<Either<DataException, MovieDetails>> getMovieDetails(
      {required String movieId}) async {
    final result = await _movieDataSource.getMovieDetails(movieId: movieId);
    return result.fold(
      (l) {
        DataException exception;

        if (l is EmptyResultException) {
          exception = const NoMovieDetailsFoundException();
        } else {
          exception = const MovieDetailsFetchFailureException();
        }

        return Left(exception);
      },
      (r) => Right(r),
    );
  }
}
