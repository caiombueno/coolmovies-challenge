import 'package:coolmovies/src/data/data.dart';
import 'package:coolmovies/src/models/models.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
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

    Future<QueryResult<Q>> makeQuery<Q>() => graphQlClient.query(any());

    Future<QueryResult<Q>> makeMutation<Q>() => graphQlClient.mutate(any());

    QueryResult<Q> getMockQueryResultOfType<Q>(
      Map<String, dynamic>? data, {
      bool hasException = false,
    }) {
      final queryResult = MockQueryResult<Q>();

      when(() => queryResult.data).thenReturn(data);
      when(() => queryResult.hasException).thenReturn(hasException);

      return queryResult;
    }

    void verifySingleCallAndNoMoreInteractionsToQuery(
        Future<QueryResult> Function() query) {
      verify(query).called(1);
      verifyNoMoreInteractions(graphQlClient);
    }

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

      final jsonData = {
        "__typename": "Query",
        "allMovies": {
          "__typename": "MovieConnection",
          "nodes": [node, node],
        }
      };

      setUpAll(() =>
          registerFallbackValue(FakeQueryOptions<Query$GetMovieSummaryList>()));

      Future<QueryResult<Query$GetMovieSummaryList>> getMovieSummariesQuery() =>
          makeQuery<Query$GetMovieSummaryList>();

      QueryResult<Query$GetMovieSummaryList> getMockQueryResult(
        Map<String, dynamic>? data, {
        bool hasException = false,
      }) =>
          getMockQueryResultOfType<Query$GetMovieSummaryList>(
            data,
            hasException: hasException,
          );

      void verifySingleCallAndNoMoreInteractions() =>
          verifySingleCallAndNoMoreInteractionsToQuery(getMovieSummariesQuery);

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

        final mockQueryResult = getMockQueryResult(jsonData);

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

      test(
          'should throw ServerCommunicationFailureException when there is a query error',
          () async {
        // arrange
        when(getMovieSummariesQuery).thenThrow(Exception());

        // act
        final summariesEither = await dataSource.getMovieSummaryList();

        // assert
        expectLeft<Exception, List<MovieSummary>,
            ServerCommunicationFailureException>(summariesEither);
        verifySingleCallAndNoMoreInteractions();
      });

      test(
          'should throw ServerCommunicationFailureException when hasException is true',
          () async {
        // arrange
        final queryResult = getMockQueryResult(jsonData, hasException: true);

        when(getMovieSummariesQuery).thenAnswer((_) async => queryResult);

        // act
        final summariesEither = await dataSource.getMovieSummaryList();

        // assert
        expectLeft<Exception, List<MovieSummary>,
            ServerCommunicationFailureException>(summariesEither);
        verifySingleCallAndNoMoreInteractions();
      });
    });

    group('getMovieDetails', () {
      const movieDetails = MovieDetails(
        movieId: '1',
        title: 'Movie 1',
        imgUrl: 'img1.png',
        releaseDate: '2021-01-01',
        reviews: [MovieReview(reviewId: '1')],
        director: MovieDirector(directorId: '1', name: 'Director 1'),
      );

      final jsonData = {
        "__typename": "Query",
        "movieById": {
          "__typename": "Movie",
          "id": movieDetails.movieId,
          "title": movieDetails.title,
          "releaseDate": movieDetails.releaseDate,
          "imgUrl": movieDetails.imgUrl,
          "movieDirectorByMovieDirectorId": {
            "__typename": "MovieDirector",
            "id": movieDetails.director?.directorId,
            "name": movieDetails.director?.name,
          },
          "movieReviewsByMovieId": {
            "__typename": "MovieReviewConnection",
            "nodes": [
              {
                "__typename": "MovieReview",
                "id": movieDetails.reviews.first.reviewId,
              }
            ]
          }
        }
      };

      setUpAll(() =>
          registerFallbackValue(FakeQueryOptions<Query$GetMovieDetails>()));

      Future<QueryResult<Query$GetMovieDetails>> getMovieDetailsQuery() =>
          makeQuery<Query$GetMovieDetails>();

      QueryResult<Query$GetMovieDetails> getMockQueryResult(
        Map<String, dynamic>? data, {
        bool hasException = false,
      }) =>
          getMockQueryResultOfType<Query$GetMovieDetails>(
            data,
            hasException: hasException,
          );

      void verifySingleCallAndNoMoreInteractions() =>
          verifySingleCallAndNoMoreInteractionsToQuery(getMovieDetailsQuery);

      test('should return movie details when response is successful', () async {
        // arrange
        final queryResult = getMockQueryResult(jsonData);

        when(getMovieDetailsQuery).thenAnswer((_) async => queryResult);

        // act
        final movieDetailsEither =
            await dataSource.getMovieDetails(movieId: movieDetails.movieId);

        // assert
        expectRight<Exception, MovieDetails>(
          movieDetailsEither,
          movieDetails,
        );
        verifySingleCallAndNoMoreInteractions();
      });

      test('should throw EmptyResultException when response is empty',
          () async {
        // arrange
        final queryResult = getMockQueryResult({});

        when(getMovieDetailsQuery).thenAnswer((_) async => queryResult);

        // act
        final movieDetailsEither =
            await dataSource.getMovieDetails(movieId: '');

        // assert
        expectLeft<Exception, MovieDetails, EmptyResultException>(
            movieDetailsEither);
        verifySingleCallAndNoMoreInteractions();
      });

      test('should throw EmptyResultException when response is null', () async {
        // arrange
        final queryResult = getMockQueryResult(null);

        when(getMovieDetailsQuery).thenAnswer((_) async => queryResult);

        // act
        final movieDetailsEither =
            await dataSource.getMovieDetails(movieId: '');

        // assert
        expectLeft<Exception, MovieDetails, EmptyResultException>(
            movieDetailsEither);
        verifySingleCallAndNoMoreInteractions();
      });

      test(
          'should throw ServerCommunicationFailureException when there is a query error',
          () async {
        // arrange
        when(getMovieDetailsQuery).thenThrow(Exception());

        // act
        final movieDetailsEither =
            await dataSource.getMovieDetails(movieId: '');

        // assert
        expectLeft<Exception, MovieDetails,
            ServerCommunicationFailureException>(movieDetailsEither);
        verifySingleCallAndNoMoreInteractions();
      });

      test(
          'should throw ServerCommunicationFailureException when hasException is true',
          () async {
        // arrange
        final queryResult = getMockQueryResult(jsonData, hasException: true);

        when(getMovieDetailsQuery).thenAnswer((_) async => queryResult);

        // act
        final movieDetailsEither =
            await dataSource.getMovieDetails(movieId: '');

        // assert
        expectLeft<Exception, MovieDetails,
            ServerCommunicationFailureException>(movieDetailsEither);
        verifySingleCallAndNoMoreInteractions();
      });
    });

    group('getMovieReviews', () {
      setUpAll(() =>
          registerFallbackValue(FakeQueryOptions<Query$GetMovieReviews>()));

      Future<QueryResult<Query$GetMovieReviews>> getMovieReviewsQuery() =>
          makeQuery<Query$GetMovieReviews>();

      QueryResult<Query$GetMovieReviews> getMockQueryResult(
        Map<String, dynamic>? data, {
        bool hasException = false,
      }) =>
          getMockQueryResultOfType<Query$GetMovieReviews>(
            data,
            hasException: hasException,
          );

      void verifySingleCallAndNoMoreInteractions() =>
          verifySingleCallAndNoMoreInteractionsToQuery(getMovieReviewsQuery);

      const movieReview = MovieReview(
        reviewId: '1',
        title: 'Review 1',
        body: 'Review body',
        rating: 4,
        reviewer: User(userId: '1', name: 'Reviewer 1'),
      );
      const movieReviewList = MovieReviewList(
        movieId: '1',
        reviews: [movieReview],
      );

      final jsonData = {
        "__typename": "Query",
        "movieById": {
          "__typename": "Movie",
          "id": movieReviewList.movieId,
          "movieReviewsByMovieId": {
            "__typename": "MovieReviewConnection",
            "nodes": [
              {
                "__typename": "MovieReview",
                "id": movieReview.reviewId,
                "title": movieReview.title,
                "body": movieReview.body,
                "rating": movieReview.rating,
                "userByUserReviewerId": {
                  "__typename": "User",
                  "id": movieReview.reviewer?.userId,
                  "name": movieReview.reviewer?.name,
                }
              },
            ]
          }
        }
      };

      Future<Either<Exception, MovieReviewList>> getMovieReviews() =>
          dataSource.getMovieReviews(movieId: '');

      test('should return movie review list when response is successful',
          () async {
        // arrange

        final mockQueryResult = getMockQueryResult(jsonData);

        when(getMovieReviewsQuery).thenAnswer((_) async => mockQueryResult);

        // act
        final movieReviewsEither = await getMovieReviews();

        // assert
        expectRight<Exception, MovieReviewList>(
            movieReviewsEither, movieReviewList);
        verifySingleCallAndNoMoreInteractions();
      });

      test('should throw EmptyResultException when response is empty',
          () async {
        // arrange
        final queryResult = getMockQueryResult({});

        when(getMovieReviewsQuery).thenAnswer((_) async => queryResult);

        // act
        final movieReviewsEither = await getMovieReviews();

        // assert
        expectLeft<Exception, MovieReviewList, EmptyResultException>(
            movieReviewsEither);
        verifySingleCallAndNoMoreInteractions();
      });

      test('should throw EmptyResultException when response is null', () async {
        // arrange
        final queryResult = getMockQueryResult(null);

        when(getMovieReviewsQuery).thenAnswer((_) async => queryResult);

        // act
        final movieReviewsEither = await getMovieReviews();

        // assert
        expectLeft<Exception, MovieReviewList, EmptyResultException>(
            movieReviewsEither);
        verifySingleCallAndNoMoreInteractions();
      });

      test(
          'should throw ServerCommunicationFailureException when there is a query error',
          () async {
        // arrange
        when(getMovieReviewsQuery).thenThrow(Exception());

        // act
        final movieReviewsEither = await getMovieReviews();

        // assert
        expectLeft<Exception, MovieReviewList,
            ServerCommunicationFailureException>(movieReviewsEither);
        verifySingleCallAndNoMoreInteractions();
      });

      test(
          'should throw ServerCommunicationFailureException when hasException is true',
          () async {
        // arrange
        final queryResult = getMockQueryResult(jsonData, hasException: true);

        when(getMovieReviewsQuery).thenAnswer((_) async => queryResult);

        // act
        final movieReviewsEither = await getMovieReviews();

        // assert
        expectLeft<Exception, MovieReviewList,
            ServerCommunicationFailureException>(movieReviewsEither);
        verifySingleCallAndNoMoreInteractions();
      });
    });

    group('createMovieReview', () {
      Future<QueryResult<Query$GetCurrentUser>> getCurrentUserQuery() =>
          makeQuery<Query$GetCurrentUser>();

      QueryResult<Query$GetCurrentUser> getCurrentUserIdMockQueryResult(
        Map<String, dynamic>? data, {
        bool hasException = false,
      }) =>
          getMockQueryResultOfType<Query$GetCurrentUser>(
            data,
            hasException: hasException,
          );

      setUpAll(() {
        registerFallbackValue(
            FakeMutationOptions<Mutation$CreateMovieReview>());

        registerFallbackValue(FakeQueryOptions<Query$GetCurrentUser>());

        const currentUser = User(userId: 'user1', name: 'User 1');

        final currentUsedIdJsonData = {
          "__typename": "Query",
          "currentUser": {
            "__typename": "User",
            "id": currentUser.userId,
            "name": currentUser.name
          }
        };
        when(getCurrentUserQuery).thenAnswer((_) async =>
            getCurrentUserIdMockQueryResult(currentUsedIdJsonData));
      });

      Future<QueryResult<Mutation$CreateMovieReview>>
          createMovieReviewMutation() =>
              makeMutation<Mutation$CreateMovieReview>();

      QueryResult<Mutation$CreateMovieReview> getMockQueryResult(
        Map<String, dynamic>? data, {
        bool hasException = false,
      }) =>
          getMockQueryResultOfType<Mutation$CreateMovieReview>(
            data,
            hasException: hasException,
          );

      Future<Either<Exception, MovieReview>> createMovieReview() =>
          dataSource.createMovieReview(
            movieId: '',
            title: '',
          );

      void verifySingleCallsAndNoMoreInteractions() {
        verify(getCurrentUserQuery).called(1);
        verify(createMovieReviewMutation).called(1);
        verifyNoMoreInteractions(graphQlClient);
      }

      const movieReview = MovieReview(
        reviewId: '1',
        title: 'Review 1',
        body: 'Review body',
        rating: 4,
        reviewer: User(userId: '1', name: 'Reviewer 1'),
      );

      final jsonData = {
        "__typename": "Query",
        "createMovieReview": {
          "__typename": "CreateMovieReviewPayload",
          "movieReview": {
            "__typename": "MovieReview",
            "id": movieReview.reviewId,
            "title": movieReview.title,
            "body": movieReview.body,
            "rating": movieReview.rating,
            "userByUserReviewerId": {
              "__typename": "User",
              "id": movieReview.reviewer?.userId,
              "name": movieReview.reviewer?.name,
            },
          },
        },
      };

      test('should return created movie review when response is successful',
          () async {
        // arrange
        final mockQueryResult = getMockQueryResult(jsonData);

        when(createMovieReviewMutation)
            .thenAnswer((_) async => mockQueryResult);

        // act
        final movieReviewEither = await createMovieReview();

        // assert
        expectRight<Exception, MovieReview>(movieReviewEither, movieReview);
        verifySingleCallsAndNoMoreInteractions();
      });

      test('should throw EmptyResultException when response is empty',
          () async {
        // arrange
        final queryResult = getMockQueryResult({});

        when(createMovieReviewMutation).thenAnswer((_) async => queryResult);

        // act
        final movieReviewEither = await createMovieReview();

        // assert
        expectLeft<Exception, MovieReview, EmptyResultException>(
            movieReviewEither);
        verifySingleCallsAndNoMoreInteractions();
      });

      test('should throw EmptyResultException when response is null', () async {
        // arrange
        final queryResult = getMockQueryResult(null);

        when(createMovieReviewMutation).thenAnswer((_) async => queryResult);

        // act
        final movieReviewEither = await createMovieReview();

        // assert
        expectLeft<Exception, MovieReview, EmptyResultException>(
            movieReviewEither);
        verifySingleCallsAndNoMoreInteractions();
      });

      test(
          'should throw ServerCommunicationFailureException when there is a mutation error',
          () async {
        // arrange
        when(createMovieReviewMutation).thenThrow(Exception());

        // act
        final movieReviewEither = await createMovieReview();

        // assert
        expectLeft<Exception, MovieReview, ServerCommunicationFailureException>(
            movieReviewEither);
        verifySingleCallsAndNoMoreInteractions();
      });

      test(
          'should throw ServerCommunicationFailureException when hasException is true',
          () async {
        // arrange
        final queryResult = getMockQueryResult(jsonData, hasException: true);

        when(createMovieReviewMutation).thenAnswer((_) async => queryResult);

        // act
        final movieReviewEither = await createMovieReview();

        // assert
        expectLeft<Exception, MovieReview, ServerCommunicationFailureException>(
            movieReviewEither);
        verifySingleCallsAndNoMoreInteractions();
      });
    });
  });
}
