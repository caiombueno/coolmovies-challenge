import 'package:flutter_test/flutter_test.dart';
import 'package:graphql/client.dart';

class FakeQueryOptions<T> extends Fake implements QueryOptions<T> {}

class FakeMutationOptions<T> extends Fake implements MutationOptions<T> {}
