import 'package:coolmovies/src/data/data_sources/movie_data_source.dart';
import 'package:coolmovies/src/data/data_sources/operations/operations.dart';
import 'package:coolmovies/src/models/exceptions.dart';
import 'package:coolmovies/src/models/movie_summary.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql/client.dart';
import 'package:mocktail/mocktail.dart';
import '../../../fakes.dart';
import '../../../mocks.dart';
import '../../../utils/utils.dart';

void main() {
  group('MovieDataSource', () {
    late final MovieDataSource dataSource;
    late final GraphQLClient graphQlClient;

    setUpAll(() {
      graphQlClient = MockGraphQLClient();
      dataSource = MovieDataSource.forTesting(graphQlClient);
    });

    group('getMovieSummaryList', () {
      const id = '1';
      const title = 'Movie 1';
      const imgUrl = 'img1.png';
      const ratingList = [4, 5];
      const overallRating = 4.5;

      const typename = 'MovieSummary';

      final node = {
        "__typename": typename,
        "id": id,
        "title": title,
        "imgUrl": imgUrl,
        "movieReviewsByMovieId": {
          "__typename": "MovieReviewConnection",
          "nodes": [
            {
              "__typename": "MovieReview",
              "rating": ratingList.first,
            },
            {
              "__typename": "MovieReview",
              "rating": ratingList.last,
            }
          ]
        }
      };

      final resultData = {
        "__typename": "Query",
        "allMovies": {
          "__typename": "MovieConnection",
          "nodes": [node, node],
        }
      };

      setUpAll(() =>
          registerFallbackValue(FakeQueryOptions<Query$GetMovieSummaryList>()));

      Future<QueryResult<Query$GetMovieSummaryList>> getMovieSummariesQuery() =>
          graphQlClient.query(any());

      QueryResult<Query$GetMovieSummaryList> getMockQueryResult(
        Map<String, dynamic>? data, {
        bool hasException = false,
      }) {
        final queryResult = MockQueryResult<Query$GetMovieSummaryList>();

        when(() => queryResult.data).thenReturn(data);
        when(() => queryResult.hasException).thenReturn(hasException);

        return queryResult;
      }

      void verifySingleCallAndNoMoreInteractions() {
        verify(getMovieSummariesQuery).called(1);
        verifyNoMoreInteractions(graphQlClient);
      }

      test('should return movie summaries when response is successful',
          () async {
        // arrange
        const movieSummary = MovieSummary(
          id: id,
          title: title,
          imgUrl: imgUrl,
          overallRating: overallRating,
        );

        final mockMovieSummaries = [movieSummary, movieSummary];

        final mockQueryResult = getMockQueryResult(resultData);

        when(getMovieSummariesQuery).thenAnswer((_) async => mockQueryResult);

        // act
        final summariesEither = await dataSource.getMovieSummaryList();

        // assert
        expectRight<Exception, List<MovieSummary>>(
          summariesEither,
          mockMovieSummaries,
        );
        verifySingleCallAndNoMoreInteractions();
      });

      test('should throw EmptyResultException when response is empty',
          () async {
        // arrange
        final queryResult = getMockQueryResult({});

        when(getMovieSummariesQuery).thenAnswer((_) async => queryResult);

        // act
        final summariesEither = await dataSource.getMovieSummaryList();

        // assert
        expectLeft<Exception, List<MovieSummary>, EmptyResultException>(
            summariesEither);
        verifySingleCallAndNoMoreInteractions();
      });

      test('should throw EmptyResultException when response is null', () async {
        // arrange
        final queryResult = getMockQueryResult(null);

        when(getMovieSummariesQuery).thenAnswer((_) async => queryResult);

        // act
        final summariesEither = await dataSource.getMovieSummaryList();

        // assert
        expectLeft<Exception, List<MovieSummary>, EmptyResultException>(
            summariesEither);
        verifySingleCallAndNoMoreInteractions();
      });

      test('should throw QueryFailureException when there is a query error',
          () async {
        // arrange
        when(getMovieSummariesQuery).thenThrow(Exception());

        // act
        final summariesEither = await dataSource.getMovieSummaryList();

        // assert
        expectLeft<Exception, List<MovieSummary>, QueryFailureException>(
            summariesEither);
        verifySingleCallAndNoMoreInteractions();
      });

      test('should throw QueryFailureException when hasException is true',
          () async {
        // arrange
        final queryResult = getMockQueryResult(resultData, hasException: true);

        when(getMovieSummariesQuery).thenAnswer((_) async => queryResult);

        // act
        final summariesEither = await dataSource.getMovieSummaryList();

        // assert
        expectLeft<Exception, List<MovieSummary>, QueryFailureException>(
            summariesEither);
        verifySingleCallAndNoMoreInteractions();
      });
    });
  });
}
