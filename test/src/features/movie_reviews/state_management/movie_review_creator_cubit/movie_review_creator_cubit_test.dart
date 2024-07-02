import 'package:bloc_test/bloc_test.dart';
import 'package:coolmovies/src/data/data.dart';
import 'package:coolmovies/src/features/movie_reviews/state_management/state_management.dart';
import 'package:coolmovies/src/models/exceptions.dart';
import 'package:coolmovies/src/models/models.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../../mocks.dart';

void main() {
  group('MovieReviewCreatorCubit', () {
    late MovieRepository movieRepository;
    late MovieReviewCreatorCubit movieReviewCreatorCubit;

    setUp(() {
      movieRepository = MockMovieRepository();
      movieReviewCreatorCubit = MovieReviewCreatorCubit(movieRepository);
    });

    tearDown(() {
      movieReviewCreatorCubit.close();
    });

    test(
        'initial state is MovieReviewCreatorInitial',
        () => expect(
            movieReviewCreatorCubit.state, const MovieReviewCreatorInitial()));

    group('createMovieReview', () {
      void verifyRepositorySingleCallAndNoMoreInteractions() {
        verify(() => movieRepository.createMovieReview(
            movieId: any(named: 'movieId'),
            title: any(named: 'title'),
            body: any(named: 'body'),
            rating: any(named: 'rating'))).called(1);
        verifyNoMoreInteractions(movieRepository);
      }

      When<Future<Either<AppException, Unit>>> stubRepositoryCall() =>
          when(() => movieRepository.createMovieReview(
              movieId: any(named: 'movieId'),
              title: any(named: 'title'),
              body: any(named: 'body'),
              rating: any(named: 'rating')));

      void callCreateMovieReview() =>
          movieReviewCreatorCubit.createMovieReview(movieId: '', title: '');

      blocTest<MovieReviewCreatorCubit, MovieReviewCreatorState>(
        'emits [MovieReviewCreatorLoading, MovieReviewCreatorLoaded] when createMovieReview succeeds',
        setUp: () => when(() =>
            stubRepositoryCall().thenAnswer((_) async => const Right(unit))),
        build: () => movieReviewCreatorCubit,
        act: (cubit) => callCreateMovieReview(),
        expect: () => [
          isA<MovieReviewCreatorLoading>(),
          isA<MovieReviewCreatorLoaded>(),
        ],
        verify: (_) => verifyRepositorySingleCallAndNoMoreInteractions(),
      );

      blocTest<MovieReviewCreatorCubit, MovieReviewCreatorState>(
        'emits [MovieReviewCreatorLoading, MovieReviewCreatorFailed] when createMovieReview fails',
        setUp: () => when(() => stubRepositoryCall().thenAnswer(
              (_) async => const Left(MovieReviewCreationFailureException()),
            )),
        build: () => movieReviewCreatorCubit,
        act: (cubit) => callCreateMovieReview(),
        expect: () => [
          isA<MovieReviewCreatorLoading>(),
          isA<MovieReviewCreatorFailed>(),
        ],
        verify: (cubit) {
          verifyRepositorySingleCallAndNoMoreInteractions();
          final exception = (cubit.state as MovieReviewCreatorFailed).exception;
          expect(exception, const MovieReviewCreationFailureException());
        },
      );
    });
  });
}
