import 'package:coolmovies/src/data/data_sources/data_sources.dart';
import 'package:graphql/client.dart';
import 'package:mocktail/mocktail.dart';

class MockGraphQLClient extends Mock implements GraphQLClient {}

class MockQueryResult<T> extends Mock implements QueryResult<T> {}

class MockMovieDataSource extends Mock implements MovieDataSource {}
