import 'package:bloc_test/bloc_test.dart';
import 'package:coolmovies/src/data/data.dart';
import 'package:coolmovies/src/features/movie_reviews/state_management/state_management.dart';
import 'package:coolmovies/src/models/models.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../../mocks.dart';

void main() {
  group('MovieReviewCreatorCubit', () {
    late MovieRepository movieRepository;
    late MovieReviewRetrieverCubit movieReviewRetrieverCubit;

    const movieReviewList = MovieReviewList(
        movieId: 'movieId', reviews: [MovieReview(reviewId: 'reviewId')]);

    setUp(() {
      movieRepository = MockMovieRepository();
      movieReviewRetrieverCubit = MovieReviewRetrieverCubit(movieRepository);
    });

    tearDown(() {
      movieReviewRetrieverCubit.close();
    });

    test(
        'initial state is MovieListLoading',
        () => expect(movieReviewRetrieverCubit.state,
            const MovieReviewsRetrieverLoading()));

    group('getMovieReviews', () {
      void verifyRepositorySingleCallAndNoMoreInteractions() {
        verify(() =>
                movieRepository.getMovieReviews(movieId: any(named: 'movieId')))
            .called(1);
        verifyNoMoreInteractions(movieRepository);
      }

      When<Future<Either<DomainException, MovieReviewList>>>
          stubRepositoryCall() => when(() =>
              movieRepository.getMovieReviews(movieId: any(named: 'movieId')));

      void callGetMovieReviews() =>
          movieReviewRetrieverCubit.getMovieReviews(movieId: '');

      blocTest<MovieReviewRetrieverCubit, MovieReviewRetrieverState>(
          'emits [MovieReviewsRetrieverLoaded] when getMovieReviews succeeds',
          setUp: () => when(() => stubRepositoryCall().thenAnswer(
                (_) async => const Right(movieReviewList),
              )),
          build: () => movieReviewRetrieverCubit,
          act: (cubit) => callGetMovieReviews(),
          expect: () => [isA<MovieReviewsRetrieverLoaded>()],
          verify: (cubit) {
            verifyRepositorySingleCallAndNoMoreInteractions();
            final reviews =
                (cubit.state as MovieReviewsRetrieverLoaded).reviewList;
            expect(reviews, movieReviewList);
          });

      blocTest<MovieReviewRetrieverCubit, MovieReviewRetrieverState>(
        'emits [MovieReviewsRetrieverFailed] when getMovieReviews fails',
        setUp: () => when(() => stubRepositoryCall().thenAnswer(
              (_) async => const Left(MovieReviewsFetchFailureException()),
            )),
        build: () => movieReviewRetrieverCubit,
        act: (cubit) => callGetMovieReviews(),
        expect: () => [isA<MovieReviewsRetrieverFailed>()],
        verify: (cubit) {
          verifyRepositorySingleCallAndNoMoreInteractions();
          final exception =
              (cubit.state as MovieReviewsRetrieverFailed).exception;
          expect(exception, const MovieReviewsFetchFailureException());
        },
      );
    });
  });
}
