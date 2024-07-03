import 'package:bloc_test/bloc_test.dart';
import 'package:coolmovies/src/data/data.dart';
import 'package:coolmovies/src/features/movie_details/state_management/state_management.dart';
import 'package:coolmovies/src/features/movie_list/state_management/state_management.dart';
import 'package:coolmovies/src/features/movie_reviews/state_management/state_management.dart';
import 'package:graphql/client.dart';
import 'package:injectable/injectable.dart';
import 'package:mocktail/mocktail.dart';

class MockGraphQLClient extends Mock implements GraphQLClient {}

class MockQueryResult<T> extends Mock implements QueryResult<T> {}

class MockMovieDataSource extends Mock implements MovieRemoteDataSource {}

@LazySingleton(as: MovieRepository, env: [Environment.test])
class MockMovieRepository extends Mock implements MovieRepository {}

class MockMovieListCubit extends MockCubit<MovieListState>
    implements MovieListCubit {}

class MockMovieDetailsCubit extends MockCubit<MovieDetailsState>
    implements MovieDetailsCubit {}

class MockMovieReviewRetrieverCubit extends MockCubit<MovieReviewRetrieverState>
    implements MovieReviewRetrieverCubit {}

class MockMovieReviewCreatorCubit extends MockCubit<MovieReviewCreatorState>
    implements MovieReviewCreatorCubit {}
