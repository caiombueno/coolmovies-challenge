import 'package:coolmovies/src/data/data_sources/data_sources.dart';
import 'package:coolmovies/src/data/repositories/repositories.dart';
import 'package:coolmovies/src/models/models.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import '../../../mocks.dart';
import '../../../utils/utils.dart';

void main() {
  group('MovieRepository', () {
    late final MovieDataSource movieDataSource;
    late final MovieRepository movieRepository;

    setUpAll(() {
      movieDataSource = MockMovieDataSource();
      movieRepository = MovieRepository(movieDataSource);
    });

    group('getMovieSummaryList', () {
      void verifySingleCallAndNoMoreInteractions() {
        verify(() => movieDataSource.getMovieSummaryList()).called(1);
        verifyNoMoreInteractions(movieDataSource);
      }

      test(
          'should return list of MovieSummary when data source call is successful',
          () async {
        // arrange
        const movieSummaries = [MovieSummary(id: '1', title: 'Test Movie')];
        when(() => movieDataSource.getMovieSummaryList())
            .thenAnswer((_) async => const Right(movieSummaries));

        // act
        final result = await movieRepository.getMovieSummaryList();

        // assert
        expectRight<DataException, List<MovieSummary>>(result, movieSummaries);
        verifySingleCallAndNoMoreInteractions();
      });

      test(
          'should return NoMoviesFoundException when data source returns EmptyResultException',
          () async {
        // arrange
        when(() => movieDataSource.getMovieSummaryList()).thenAnswer(
          (_) async => const Left(EmptyResultException()),
        );

        // act
        final result = await movieRepository.getMovieSummaryList();

        // assert
        expectLeft<DataException, List<MovieSummary>, NoMoviesFoundException>(
            result);
        verifySingleCallAndNoMoreInteractions();
      });

      test(
          'should return MoviesFetchFailureException when data source call fails',
          () async {
        // arrange
        when(() => movieDataSource.getMovieSummaryList()).thenAnswer(
          (_) async => const Left(MoviesFetchFailureException()),
        );

        // act
        final result = await movieRepository.getMovieSummaryList();

        // assert
        expectLeft<DataException, List<MovieSummary>,
            MoviesFetchFailureException>(result);
        verifySingleCallAndNoMoreInteractions();
      });
    });
  });
}
