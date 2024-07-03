import 'package:coolmovies/src/features/commons/components/exception_failure_indicator.dart';
import 'package:coolmovies/src/features/movie_reviews/state_management/state_management.dart';
import 'package:coolmovies/src/features/movie_reviews/view/components/components.dart';
import 'package:coolmovies/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../mocks.dart';
import '../../../../../utils/configure_test_dependencies/configure_test_dependencies.dart';
import '../../../../../utils/pump_app.dart';

void main() {
  late MockMovieReviewCreatorCubit mockMovieReviewCreatorCubit;

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  setUp(() {
    mockMovieReviewCreatorCubit = MockMovieReviewCreatorCubit();
    when(() => mockMovieReviewCreatorCubit.createMovieReview(
          title: any(named: 'title'),
          body: any(named: 'body'),
          rating: any(named: 'rating'),
          movieId: any(named: 'movieId'),
        )).thenAnswer((_) async {});
  });

  group('AddReviewDialog', () {
    setUpAll(() {
      configureTestDependencies();
    });

    testWidgets('uses provided key', (tester) async {
      // arrange
      final key = UniqueKey();

      // act
      await tester.pumpAddReviewDialog(key: key);

      // assert
      expect(find.byKey(key), findsOneWidget);
    });

    testWidgets('renders AddReviewDialogView', (tester) async {
      // act
      await tester.pumpAddReviewDialog();

      final addReviewDialogViewFinder = find.byType(AddReviewDialogView);

      // assert
      expect(addReviewDialogViewFinder, findsOneWidget);
    });
  });

  group('AddReviewDialogView', () {
    testWidgets('uses provided key', (tester) async {
      // arrange
      when(() => mockMovieReviewCreatorCubit.state)
          .thenReturn(const MovieReviewCreatorInitial());
      final key = UniqueKey();

      // act
      await tester.pumpAddReviewDialogView(
        mockMovieReviewCreatorCubit,
        key: key,
      );

      // assert
      expect(find.byKey(key), findsOneWidget);
    });

    testWidgets('renders correctly', (tester) async {
      // arrange
      when(() => mockMovieReviewCreatorCubit.state)
          .thenReturn(const MovieReviewCreatorInitial());

      // act
      await tester.pumpAddReviewDialogView(mockMovieReviewCreatorCubit);

      // assert
      final dialogFinder = find.byType(Dialog);

      expect(dialogFinder, findsOneWidget);
    });

    testWidgets(
        'shows MovieReviewForm when movie review hasn\'t been created nor submitted',
        (tester) async {
      // arrange
      when(() => mockMovieReviewCreatorCubit.state)
          .thenReturn(const MovieReviewCreatorInitial());

      // act
      await tester.pumpAddReviewDialogView(mockMovieReviewCreatorCubit);

      // assert
      final movieReviewFormFinder = find.byType(MovieReviewForm);

      expect(movieReviewFormFinder, findsOneWidget);
    });

    testWidgets('shows loading indicator when movie review is being created',
        (tester) async {
      // arrange
      when(() => mockMovieReviewCreatorCubit.state)
          .thenReturn(const MovieReviewCreatorLoading());

      // act
      await tester.pumpAddReviewDialogView(mockMovieReviewCreatorCubit);

      // assert
      final circularProgressIndicatorFinder =
          find.byType(CircularProgressIndicator);

      expect(circularProgressIndicatorFinder, findsOneWidget);
    });

    testWidgets('shows loaded indicator when movies are loaded successfully',
        (tester) async {
      // arrange
      when(() => mockMovieReviewCreatorCubit.state)
          .thenReturn(const MovieReviewCreatorLoaded());

      // act
      await tester.pumpAddReviewDialogView(mockMovieReviewCreatorCubit);

      // assert
      final columnFinder = find.byType(Column);
      final checkCircleIconTile = find.byIcon(Icons.check_circle);

      expect(columnFinder, findsOneWidget);
      expect(checkCircleIconTile, findsOneWidget);
    });

    testWidgets(
        'shows ExceptionFailureIndicator when review fail to be created',
        (tester) async {
      // arrange
      when(() => mockMovieReviewCreatorCubit.state).thenReturn(
        const MovieReviewCreatorFailed(MovieReviewCreationFailureException()),
      );

      // act
      await tester.pumpAddReviewDialogView(mockMovieReviewCreatorCubit);

      // assert
      final exceptionFailureIndicatorFinder =
          find.byType(ExceptionFailureIndicator);

      expect(exceptionFailureIndicatorFinder, findsOneWidget);
    });
  });
}

extension on WidgetTester {
  Future<void> pumpAddReviewDialog({Key? key}) {
    return pumpApp(AddReviewDialog(movieId: '', key: key));
  }

  Future<void> pumpAddReviewDialogView(
      MockMovieReviewCreatorCubit mockMovieReviewCreatorCubit,
      {Key? key}) {
    return pumpApp(
      BlocProvider<MovieReviewCreatorCubit>.value(
        value: mockMovieReviewCreatorCubit,
        child: AddReviewDialogView(key: key, movieId: ''),
      ),
    );
  }
}
