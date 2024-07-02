import 'package:coolmovies/src/data/data.dart';
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

      When<Future<Either<Exception, List<MovieSummary>>>>
          stubDataSourceCall() =>
              when(() => movieDataSource.getMovieSummaryList());

      test(
          'should return list of MovieSummary when data source call is successful',
          () async {
        // arrange
        const movieSummaries = [MovieSummary(id: '1', title: 'Test Movie')];
        stubDataSourceCall()
            .thenAnswer((_) async => const Right(movieSummaries));

        // act
        final result = await movieRepository.getMovieSummaryList();

        // assert
        expectRight<DataException, List<MovieSummary>>(result, movieSummaries);
        verifySingleCallAndNoMoreInteractions();
      });

      test(
          'should return NoMovieSummaryListFoundException when data source returns EmptyResultException',
          () async {
        // arrange
        stubDataSourceCall().thenAnswer(
          (_) async => const Left(EmptyResultException()),
        );

        // act
        final result = await movieRepository.getMovieSummaryList();

        // assert
        expectLeft<DataException, List<MovieSummary>,
            NoMovieSummaryListFoundException>(result);
        verifySingleCallAndNoMoreInteractions();
      });

      test(
          'should return MovieSummaryListFetchFailureException when data source call fails',
          () async {
        // arrange
        stubDataSourceCall().thenAnswer(
          (_) async => Left(Exception()),
        );

        // act
        final result = await movieRepository.getMovieSummaryList();

        // assert
        expectLeft<DataException, List<MovieSummary>,
            MovieSummaryListFetchFailureException>(result);
        verifySingleCallAndNoMoreInteractions();
      });
    });

    group('getMovieDetails', () {
      void verifySingleCallAndNoMoreInteractions() {
        verify(() =>
                movieDataSource.getMovieDetails(movieId: any(named: 'movieId')))
            .called(1);
        verifyNoMoreInteractions(movieDataSource);
      }

      When<Future<Either<Exception, MovieDetails>>> stubDataSourceCall() =>
          when(() =>
              movieDataSource.getMovieDetails(movieId: any(named: 'movieId')));

      Future<Either<DataException, MovieDetails>> getMovieDetails() =>
          movieRepository.getMovieDetails(movieId: '');

      test('should return MovieDetails when data source call is successful',
          () async {
        // arrange
        const movieDetails = MovieDetails(movieId: 'movieId');
        stubDataSourceCall().thenAnswer((_) async => const Right(movieDetails));

        // act
        final result = await getMovieDetails();

        // assert
        expectRight<DataException, MovieDetails>(result, movieDetails);
        verifySingleCallAndNoMoreInteractions();
      });

      test(
          'should return NoMovieDetailsFoundException when data source returns EmptyResultException',
          () async {
        // arrange
        stubDataSourceCall()
            .thenAnswer((_) async => const Left(EmptyResultException()));

        // act
        final result = await getMovieDetails();

        // assert
        expectLeft<DataException, MovieDetails, NoMovieDetailsFoundException>(
            result);
        verifySingleCallAndNoMoreInteractions();
      });

      test(
          'should return MovieDetailsFetchFailureException when data source call fails',
          () async {
        // arrange
        stubDataSourceCall().thenAnswer((_) async => Left(Exception()));

        // act
        final result = await getMovieDetails();

        // assert
        expectLeft<DataException, MovieDetails,
            MovieDetailsFetchFailureException>(result);
        verifySingleCallAndNoMoreInteractions();
      });
    });

    group('getMovieReviews', () {
      void verifySingleCallAndNoMoreInteractions() {
        verify(() =>
                movieDataSource.getMovieReviews(movieId: any(named: 'movieId')))
            .called(1);
        verifyNoMoreInteractions(movieDataSource);
      }

      When<Future<Either<Exception, MovieReviewList>>> stubDataSourceCall() =>
          when(() =>
              movieDataSource.getMovieReviews(movieId: any(named: 'movieId')));

      Future<Either<DataException, MovieReviewList>> getMovieReviews() =>
          movieRepository.getMovieReviews(movieId: '');

      test('should return MovieReviewList when data source call is successful',
          () async {
        // arrange
        const movieReviews = MovieReviewList(movieId: 'movieId');
        stubDataSourceCall().thenAnswer((_) async => const Right(movieReviews));
        // act
        final result = await getMovieReviews();
        // assert
        expectRight<DataException, MovieReviewList>(result, movieReviews);
        verifySingleCallAndNoMoreInteractions();
      });
      test(
          'should return NoMovieReviewsFoundException when data source returns EmptyResultException',
          () async {
        // arrange
        stubDataSourceCall()
            .thenAnswer((_) async => const Left(EmptyResultException()));

        // act
        final result = await getMovieReviews();
        // assert
        expectLeft<DataException, MovieReviewList,
            NoMovieReviewsFoundException>(result);
        verifySingleCallAndNoMoreInteractions();
      });
      test(
          'should return MovieReviewsFetchFailureException when data source call fails',
          () async {
        // arrange
        stubDataSourceCall().thenAnswer((_) async => Left(Exception()));
        // act
        final result = await getMovieReviews();
        // assert
        expectLeft<DataException, MovieReviewList,
            MovieReviewsFetchFailureException>(result);
        verifySingleCallAndNoMoreInteractions();
      });
    });

    group('createMovieReview', () {
      void verifySingleCallAndNoMoreInteractions() {
        verify(() => movieDataSource.createMovieReview(
              movieId: any(named: 'movieId'),
              title: any(named: 'title'),
              body: any(named: 'body'),
              rating: any(named: 'rating'),
            )).called(1);
        verifyNoMoreInteractions(movieDataSource);
      }

      When<Future<Either<Exception, Unit>>> stubDataSourceCall() =>
          when(() => movieDataSource.createMovieReview(
                movieId: any(named: 'movieId'),
                title: any(named: 'title'),
                body: any(named: 'body'),
                rating: any(named: 'rating'),
              ));

      Future<Either<AppException, Unit>> createMovieReview() =>
          movieRepository.createMovieReview(
            movieId: 'movieId',
            title: 'Test Review',
          );

      test('should return unit when data source call is successful', () async {
        // arrange
        stubDataSourceCall().thenAnswer((_) async => const Right(unit));
        // act
        final result = await createMovieReview();
        // assert
        expectRight<AppException, Unit>(result, unit);
        verifySingleCallAndNoMoreInteractions();
      });

      test(
          'should return MovieReviewCreationFailureException when data source call fails',
          () async {
        // arrange
        stubDataSourceCall().thenAnswer((_) async => Left(Exception()));
        // act
        final result = await createMovieReview();
        // assert
        expectLeft<AppException, Unit, MovieReviewCreationFailureException>(
            result);
        verifySingleCallAndNoMoreInteractions();
      });
    });
  });
}
