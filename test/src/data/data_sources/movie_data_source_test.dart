import 'package:coolmovies/src/data/data_sources/movie_data_source.dart';
import 'package:coolmovies/src/data/data_sources/operations/operations.dart';
import 'package:coolmovies/src/models/exceptions.dart';
import 'package:coolmovies/src/models/movie_summary.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql/client.dart';

import 'package:mocktail/mocktail.dart';

import '../../../fakes.dart';
import '../../../mocks.dart';

void main() {
  group('MovieDataSource', () {
    late MovieDataSource dataSource;
    late MockGraphQLClient mockClient;

    setUp(() {
      mockClient = MockGraphQLClient();
      dataSource = MovieDataSource(mockClient);
    });

    group('getMovieSummaryList', () {
      const id = '1';
      const title = 'Movie 1';
      const imgUrl = 'img1.png';
      const releaseDate = '2023-01-01';
      const typename = 'MovieSummary';

      final resultData = {
        "allMovies": {
          "__typename": "MovieConnection",
          "nodes": [
            {
              "id": id,
              "title": title,
              "imgUrl": imgUrl,
              "releaseDate": releaseDate,
              "__typename": typename
            },
            {
              "id": id,
              "title": title,
              "imgUrl": imgUrl,
              "releaseDate": releaseDate,
              "__typename": typename
            },
          ]
        },
        "__typename": "Query"
      };

      setUpAll(() =>
          registerFallbackValue(FakeQueryOptions<Query$GetMovieSummaryList>()));

      Future<QueryResult<Query$GetMovieSummaryList>> getMovieSummariesQuery() =>
          mockClient.query(any());

      QueryResult<Query$GetMovieSummaryList> getMockQueryResult(
        Map<String, dynamic>? data, {
        bool hasException = false,
      }) {
        final queryResult = MockQueryResult<Query$GetMovieSummaryList>();

        when(() => queryResult.data).thenReturn(data);
        when(() => queryResult.hasException).thenReturn(hasException);

        return queryResult;
      }

      test('should return movie summaries when response is successful',
          () async {
        const movieSummary = MovieSummary(
          id: id,
          title: title,
          imgUrl: imgUrl,
          releaseDate: releaseDate,
        );

        final mockMovieSummaries = [movieSummary, movieSummary];

        final mockQueryResult = getMockQueryResult(resultData);

        when(getMovieSummariesQuery).thenAnswer((_) async => mockQueryResult);

        final summaries = await dataSource.getMovieSummaryList();

        expect(summaries, mockMovieSummaries);
      });

      test('should throw NoDataFoundException when response is empty',
          () async {
        final queryResult = getMockQueryResult({});

        when(getMovieSummariesQuery).thenAnswer((_) async => queryResult);

        expect(
          dataSource.getMovieSummaryList,
          throwsA(isA<NoDataFoundException>()),
        );
      });

      test('should throw NoDataFoundException when response is null', () async {
        final queryResult = getMockQueryResult(null);

        when(getMovieSummariesQuery).thenAnswer((_) async => queryResult);

        expect(
          dataSource.getMovieSummaryList,
          throwsA(isA<NoDataFoundException>()),
        );
      });

      test('should throw exception when there is a query error', () async {
        when(getMovieSummariesQuery).thenThrow(OperationException());

        expect(
            dataSource.getMovieSummaryList, throwsA(isA<OperationException>()));
      });

      test('should throw FetchDataFailureException when response has exception',
          () async {
        final queryResult = getMockQueryResult(null, hasException: true);

        when(getMovieSummariesQuery).thenAnswer((_) async => queryResult);

        expect(
          dataSource.getMovieSummaryList,
          throwsA(isA<FetchDataFailureException>()),
        );
      });
    });
  });
}
