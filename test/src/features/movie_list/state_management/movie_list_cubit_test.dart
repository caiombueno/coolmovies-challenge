import 'package:coolmovies/src/data/data.dart';
import 'package:coolmovies/src/features/movie_list/state_management/state_management.dart';
import 'package:coolmovies/src/models/models.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';

void main() {
  group('MovieListCubit', () {
    late MovieRepository movieRepository;
    late MovieListCubit movieListCubit;

    const movieSummaries = <MovieSummary>[
      MovieSummary(id: '1'),
      MovieSummary(id: '2'),
    ];

    setUp(() {
      movieRepository = MockMovieRepository();
      movieListCubit = MovieListCubit(movieRepository);
    });

    tearDown(() {
      movieListCubit.close();
    });

    test('initial state is MovieListLoading',
        () => expect(movieListCubit.state, const MovieListLoading()));

    group('getMovieSummaryList', () {
      void verifySingleCallAndNoMoreInteractions() {
        verify(() => movieRepository.getMovieSummaryList()).called(1);
        verifyNoMoreInteractions(movieRepository);
      }

      blocTest<MovieListCubit, MovieListState>(
          'emits [MovieListLoaded] when getMovieSummaryList succeeds',
          setUp: () =>
              when(() => movieRepository.getMovieSummaryList()).thenAnswer(
                (_) async => const Right(movieSummaries),
              ),
          build: () => movieListCubit,
          act: (cubit) => cubit.getMovieSummaryList(),
          expect: () => [isA<MovieListLoaded>()],
          verify: (cubit) {
            verifySingleCallAndNoMoreInteractions();
            final movies = (cubit.state as MovieListLoaded).movies;
            expect(movies, movieSummaries);
          });

      blocTest<MovieListCubit, MovieListState>(
        'emits [MovieListFailed] when getMovieSummaryList fails',
        setUp: () =>
            when(() => movieRepository.getMovieSummaryList()).thenAnswer(
          (_) async => const Left(MovieSummaryListFetchFailureException()),
        ),
        build: () => movieListCubit,
        act: (cubit) => cubit.getMovieSummaryList(),
        expect: () => [isA<MovieListFailed>()],
        verify: (cubit) {
          verifySingleCallAndNoMoreInteractions();
          final exception = (cubit.state as MovieListFailed).exception;
          expect(exception, const MovieSummaryListFetchFailureException());
        },
      );
    });
  });
}
