import 'package:bloc_test/bloc_test.dart';
import 'package:coolmovies/src/data/data.dart';
import 'package:coolmovies/src/features/movie_details/state_management/state_management.dart';
import 'package:coolmovies/src/models/models.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';

void main() {
  group('MovieDetailsCubit', () {
    late MovieRepository movieRepository;
    late MovieDetailsCubit movieDetailsCubit;

    const movieDetails = MovieDetails(
      movieId: 'movieId',
      title: 'title',
    );

    setUp(() {
      movieRepository = MockMovieRepository();
      movieDetailsCubit = MovieDetailsCubit(movieRepository);
    });

    tearDown(() {
      movieDetailsCubit.close();
    });

    test('initial state is MovieListLoading',
        () => expect(movieDetailsCubit.state, const MovieDetailsLoading()));

    group('getMovieDetails', () {
      void verifyRepositorySingleCallAndNoMoreInteractions() {
        verify(() =>
                movieRepository.getMovieDetails(movieId: any(named: 'movieId')))
            .called(1);
        verifyNoMoreInteractions(movieRepository);
      }

      When<Future<Either<DomainException, MovieDetails>>>
          stubRepositoryCall() => when(() =>
              movieRepository.getMovieDetails(movieId: any(named: 'movieId')));

      void callGetMovieDetails() => movieDetailsCubit.getMovieDetails('');

      blocTest<MovieDetailsCubit, MovieDetailsState>(
          'emits [MovieDetailsLoaded] when getMovieDetails succeeds',
          setUp: () => when(() => stubRepositoryCall().thenAnswer(
                (_) async => const Right(movieDetails),
              )),
          build: () => movieDetailsCubit,
          act: (cubit) => callGetMovieDetails(),
          expect: () => [isA<MovieDetailsLoaded>()],
          verify: (cubit) {
            verifyRepositorySingleCallAndNoMoreInteractions();
            final details = (cubit.state as MovieDetailsLoaded).movieDetails;
            expect(details, movieDetails);
          });

      blocTest<MovieDetailsCubit, MovieDetailsState>(
        'emits [MovieDetailsFailed] when getMovieDetails fails',
        setUp: () => when(() => stubRepositoryCall().thenAnswer(
              (_) async => const Left(MovieDetailsFetchFailureException()),
            )),
        build: () => movieDetailsCubit,
        act: (cubit) => callGetMovieDetails(),
        expect: () => [isA<MovieDetailsFailed>()],
        verify: (cubit) {
          verifyRepositorySingleCallAndNoMoreInteractions();
          final exception = (cubit.state as MovieDetailsFailed).exception;
          expect(exception, const MovieDetailsFetchFailureException());
        },
      );
    });
  });
}
