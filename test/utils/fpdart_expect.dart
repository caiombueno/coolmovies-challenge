import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';

void expectRight<L, R>(Either<L, R> either, R result) {
  expect(either.isRight(), true);
  expect(either, isA<Right<L, R>>().having((r) => r.value, '', result));
}

void expectLeft<L, R, E>(Either<L, R> either) {
  expect(either.isLeft(), true);
  either.fold(
    (e) => expect(e, isA<E>()),
    (_) => null,
  );
}
