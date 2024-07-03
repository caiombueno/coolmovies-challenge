import 'package:coolmovies/src/data/data.dart';
import 'package:coolmovies/src/features/commons/components/exception_failure_indicator.dart';
import 'package:coolmovies/src/features/movie_details/state_management/state_management.dart';
import 'package:coolmovies/src/features/movie_details/view/components/components.dart';
import 'package:coolmovies/src/features/movie_details/view/view.dart';
import 'package:coolmovies/src/features/movie_reviews/state_management/movie_review_retriever_cubit/movie_review_retriever_cubit.dart';
import 'package:coolmovies/src/features/movie_reviews/state_management/state_management.dart';
import 'package:coolmovies/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';
import '../../../../utils/configure_test_dependencies/configure_test_dependencies.dart';
import '../../../../utils/pump_app.dart';

void main() {
  late MockMovieDetailsCubit mockMovieDetailsCubit;
  late MockMovieReviewRetrieverCubit mockMovieReviewRetrieverCubit;

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  setUp(() {
    mockMovieDetailsCubit = MockMovieDetailsCubit();
    when(() => mockMovieDetailsCubit.getMovieDetails(
        movieId: any(named: 'movieId'))).thenAnswer((_) async {});

    mockMovieReviewRetrieverCubit = MockMovieReviewRetrieverCubit();
    when(() => mockMovieReviewRetrieverCubit.getMovieReviews(
          movieId: any(named: 'movieId'),
        )).thenAnswer((_) async {});
  });

  group('MovieDetailsScreen', () {
    late MovieRepository mockMovieRepository;

    setUpAll(() {
      configureTestDependencies();
      mockMovieRepository = testServiceLocator<MovieRepository>();
      when(() => mockMovieRepository.getMovieDetails(
              movieId: any(named: 'movieId')))
          .thenAnswer(
              ((_) => Future.value(const Right(MovieDetails(movieId: '')))));
      when(() => mockMovieRepository.getMovieReviews(
              movieId: any(named: 'movieId')))
          .thenAnswer(
              ((_) => Future.value(const Right(MovieReviewList(movieId: '')))));
    });

    testWidgets('uses provided key', (tester) async {
      // arrange
      final key = UniqueKey();

      // act
      await tester.pumpMovieDetailsScreen(key: key);

      // assert
      expect(find.byKey(key), findsOneWidget);
    });

    testWidgets('renders MovieDetailsView', (tester) async {
      // act
      await tester.pumpMovieDetailsScreen();

      final movieDetailsViewFinder = find.byType(MovieDetailsView);

      // assert
      expect(movieDetailsViewFinder, findsOneWidget);
    });
  });

  group('MovieDetailsView', () {
    testWidgets('uses provided key', (tester) async {
      // arrange
      when(() => mockMovieDetailsCubit.state)
          .thenReturn(const MovieDetailsLoading());
      final key = UniqueKey();

      // act
      await tester.pumpMovieDetailsView(
        mockMovieDetailsCubit: mockMovieDetailsCubit,
        key: key,
      );

      // assert
      expect(find.byKey(key), findsOneWidget);
    });

    testWidgets('renders correctly', (tester) async {
      // arrange
      when(() => mockMovieDetailsCubit.state)
          .thenReturn(const MovieDetailsLoading());

      // act
      await tester.pumpMovieDetailsView(
          mockMovieDetailsCubit: mockMovieDetailsCubit);

      // assert
      final appBarFinder = find.byType(Scaffold);
      final titleFinder = find.byType(AppBar);

      expect(appBarFinder, findsOneWidget);
      expect(titleFinder, findsOneWidget);
    });

    testWidgets('shows loading indicator when movie details are being loaded',
        (tester) async {
      // arrange
      when(() => mockMovieDetailsCubit.state)
          .thenReturn(const MovieDetailsLoading());

      // act
      await tester.pumpMovieDetailsView(
          mockMovieDetailsCubit: mockMovieDetailsCubit);

      // assert
      final circularProgressIndicatorFinder =
          find.byType(CircularProgressIndicator);

      expect(circularProgressIndicatorFinder, findsOneWidget);
    });

    testWidgets(
        'shows MovieDetailsContentView when movie details are loaded successfully',
        (tester) async {
      // arrange
      when(() => mockMovieDetailsCubit.state)
          .thenReturn(const MovieDetailsLoaded(MovieDetails(movieId: '')));

      when(() => mockMovieReviewRetrieverCubit.state)
          .thenReturn(const MovieReviewsRetrieverLoading());

      // act
      await tester.pumpMovieDetailsView(
          mockMovieDetailsCubit: mockMovieDetailsCubit,
          mockMovieReviewRetrieverCubit: mockMovieReviewRetrieverCubit);

      // assert
      final movieDetailsContentViewFinder =
          find.byType(MovieDetailsContentView);

      expect(movieDetailsContentViewFinder, findsOneWidget);
    });

    testWidgets(
        'shows ExceptionFailureIndicator when movie details fail to load',
        (tester) async {
      // arrange
      when(() => mockMovieDetailsCubit.state).thenReturn(
        const MovieDetailsFailed(MovieDetailsFetchFailureException()),
      );

      // act
      await tester.pumpMovieDetailsView(
          mockMovieDetailsCubit: mockMovieDetailsCubit);

      // assert
      final exceptionFailureIndicatorFinder =
          find.byType(ExceptionFailureIndicator);

      expect(exceptionFailureIndicatorFinder, findsOneWidget);
    });
  });
}

extension on WidgetTester {
  Future<void> pumpMovieDetailsScreen({Key? key}) {
    return pumpApp(MovieDetailsScreen('', key: key));
  }

  Future<void> pumpMovieDetailsView({
    Key? key,
    required MockMovieDetailsCubit mockMovieDetailsCubit,
    MockMovieReviewRetrieverCubit? mockMovieReviewRetrieverCubit,
  }) {
    return pumpApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<MovieDetailsCubit>.value(value: mockMovieDetailsCubit),
          if (mockMovieReviewRetrieverCubit != null)
            BlocProvider<MovieReviewRetrieverCubit>.value(
                value: mockMovieReviewRetrieverCubit),
        ],
        child: MovieDetailsView(key: key),
      ),
    );
  }
}
