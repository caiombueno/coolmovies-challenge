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
          exception = const NoMoviesFoundException();
        } else {
          exception = const MoviesFetchFailureException();
        }

        return Left(exception);
      },
      (r) => Right(r),
    );
  }
}
