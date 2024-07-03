import 'package:coolmovies/src/data/data.dart';
import 'package:coolmovies/src/features/commons/components/exception_failure_indicator.dart';
import 'package:coolmovies/src/features/movie_list/state_management/state_management.dart';
import 'package:coolmovies/src/features/movie_list/view/components/components.dart';
import 'package:coolmovies/src/features/movie_list/view/view.dart';
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
  late MockMovieListCubit mockMovieListCubit;

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  setUp(() {
    mockMovieListCubit = MockMovieListCubit();
    when(() => mockMovieListCubit.getMovieSummaryList())
        .thenAnswer((_) async {});
  });

  group('MovieListScreen', () {
    late MovieRepository mockMovieRepository;

    setUpAll(() {
      configureTestDependencies();
      mockMovieRepository = testServiceLocator<MovieRepository>();
      when(() => mockMovieRepository.getMovieSummaryList())
          .thenAnswer(((_) => Future.value(const Right([]))));
    });

    testWidgets('uses provided key', (tester) async {
      // arrange
      final key = UniqueKey();

      // act
      await tester.pumpMovieListScreen(key: key);

      // assert
      expect(find.byKey(key), findsOneWidget);
    });

    testWidgets('renders MovieListView', (tester) async {
      // arrange
      when(() => mockMovieListCubit.state).thenReturn(const MovieListLoading());

      // act
      await tester.pumpMovieListView(mockMovieListCubit);

      final movieListViewFinder = find.byType(MovieListView);

      // assert
      expect(movieListViewFinder, findsOneWidget);
    });
  });

  group('MovieListView', () {
    testWidgets('uses provided key', (tester) async {
      // arrange
      when(() => mockMovieListCubit.state).thenReturn(const MovieListLoading());
      final key = UniqueKey();

      // act
      await tester.pumpMovieListView(
        mockMovieListCubit,
        key: key,
      );

      // assert
      expect(find.byKey(key), findsOneWidget);
    });

    testWidgets('renders correctly', (tester) async {
      // arrange
      when(() => mockMovieListCubit.state).thenReturn(const MovieListLoading());

      // act
      await tester.pumpMovieListView(mockMovieListCubit);

      // assert
      final appBarFinder = find.byType(Scaffold);
      final titleFinder = find.byType(AppBar);

      expect(appBarFinder, findsOneWidget);
      expect(titleFinder, findsOneWidget);
    });

    testWidgets('shows loading indicator when movies are being loaded',
        (tester) async {
      // arrange
      when(() => mockMovieListCubit.state).thenReturn(const MovieListLoading());

      // act
      await tester.pumpMovieListView(mockMovieListCubit);

      // assert
      final circularProgressIndicatorFinder =
          find.byType(CircularProgressIndicator);

      expect(circularProgressIndicatorFinder, findsOneWidget);
    });

    testWidgets(
        'shows MovieSummaryGridView when movies are loaded successfully',
        (tester) async {
      // arrange
      when(() => mockMovieListCubit.state)
          .thenReturn(const MovieListLoaded([MovieSummary(id: '')]));

      // act
      await tester.pumpMovieListView(mockMovieListCubit);

      // assert
      final movieSummaryGridViewFinder = find.byType(MovieSummaryGridView);

      expect(movieSummaryGridViewFinder, findsOneWidget);
    });

    testWidgets('shows ExceptionFailureIndicator when movies fail to load',
        (tester) async {
      // arrange
      when(() => mockMovieListCubit.state).thenReturn(
        const MovieListFailed(MovieSummaryListFetchFailureException()),
      );

      // act
      await tester.pumpMovieListView(mockMovieListCubit);

      // assert
      final exceptionFailureIndicatorFinder =
          find.byType(ExceptionFailureIndicator);

      expect(exceptionFailureIndicatorFinder, findsOneWidget);
    });
  });
}

extension on WidgetTester {
  Future<void> pumpMovieListScreen({Key? key}) {
    return pumpApp(MovieListScreen(key: key));
  }

  Future<void> pumpMovieListView(MockMovieListCubit mockMovieListCubit,
      {Key? key}) {
    return pumpApp(
      BlocProvider<MovieListCubit>.value(
        value: mockMovieListCubit,
        child: MovieListView(
          key: key,
        ),
      ),
    );
  }
}
