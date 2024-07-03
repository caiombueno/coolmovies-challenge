import 'package:coolmovies/src/features/commons/components/exception_failure_indicator.dart';
import 'package:coolmovies/src/features/movie_reviews/state_management/state_management.dart';
import 'package:coolmovies/src/features/movie_reviews/view/components/movie_review_tile.dart';
import 'package:coolmovies/src/features/movie_reviews/view/view.dart';
import 'package:coolmovies/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';
import '../../../../utils/pump_app.dart';

void main() {
  late MockMovieReviewRetrieverCubit mockMovieReviewRetrieverCubit;

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  setUp(() {
    mockMovieReviewRetrieverCubit = MockMovieReviewRetrieverCubit();
    when(() => mockMovieReviewRetrieverCubit.getMovieReviews(
        movieId: any(named: 'movieId'))).thenAnswer((_) async {});
  });

  group('MovieReviewSliverList', () {
    testWidgets('uses provided key', (tester) async {
      // arrange
      when(() => mockMovieReviewRetrieverCubit.state)
          .thenReturn(const MovieReviewsRetrieverLoading());
      final key = UniqueKey();

      // act
      await tester.pumpMovieReviewSliverList(
        mockMovieReviewRetrieverCubit,
        key: key,
      );

      // assert
      expect(find.byKey(key), findsOneWidget);
    });

    testWidgets('renders correctly', (tester) async {
      // arrange
      when(() => mockMovieReviewRetrieverCubit.state)
          .thenReturn(const MovieReviewsRetrieverLoading());

      // act
      await tester.pumpMovieReviewSliverList(mockMovieReviewRetrieverCubit);

      // assert
      final blocBuilderFinder = find.byType(
          BlocBuilder<MovieReviewRetrieverCubit, MovieReviewRetrieverState>);

      expect(blocBuilderFinder, findsOneWidget);
    });

    testWidgets('shows loading indicator when movie reviews are being loaded',
        (tester) async {
      // arrange
      when(() => mockMovieReviewRetrieverCubit.state)
          .thenReturn(const MovieReviewsRetrieverLoading());

      // act
      await tester.pumpMovieReviewSliverList(mockMovieReviewRetrieverCubit);

      // assert
      final circularProgressIndicatorFinder =
          find.byType(CircularProgressIndicator);

      expect(circularProgressIndicatorFinder, findsOneWidget);
    });

    testWidgets(
        'shows SliverList of MovieReviewTile when movies are loaded successfully',
        (tester) async {
      // arrange
      const movieReviewList =
          MovieReviewList(movieId: '', reviews: [MovieReview(reviewId: '')]);
      when(() => mockMovieReviewRetrieverCubit.state)
          .thenReturn(const MovieReviewsRetrieverLoaded(movieReviewList));

      // act
      await tester.pumpMovieReviewSliverList(mockMovieReviewRetrieverCubit);

      // assert
      final sliverListFinder = find.byType(SliverList);
      final movieReviewTile = find.byType(MovieReviewTile);

      expect(sliverListFinder, findsOneWidget);
      expect(movieReviewTile, findsNWidgets(movieReviewList.reviews.length));
    });

    testWidgets('shows ExceptionFailureIndicator when movies fail to load',
        (tester) async {
      // arrange
      when(() => mockMovieReviewRetrieverCubit.state).thenReturn(
        const MovieReviewsRetrieverFailed(MovieReviewsFetchFailureException()),
      );

      // act
      await tester.pumpMovieReviewSliverList(mockMovieReviewRetrieverCubit);

      // assert
      final exceptionFailureIndicatorFinder =
          find.byType(ExceptionFailureIndicator);

      expect(exceptionFailureIndicatorFinder, findsOneWidget);
    });
  });
}

extension on WidgetTester {
  Future<void> pumpMovieReviewSliverList(
      MockMovieReviewRetrieverCubit mockMovieReviewRetrieverCubit,
      {Key? key}) {
    return pumpApp(
      BlocProvider<MovieReviewRetrieverCubit>.value(
        value: mockMovieReviewRetrieverCubit,
        child: CustomScrollView(slivers: [MovieReviewSliverList(key: key)]),
      ),
    );
  }
}
