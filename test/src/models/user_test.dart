import 'package:coolmovies/src/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('User', () {
    group('Equatable', () {
      const user = User(
        userId: 'id',
        name: 'name',
      );

      test('props should return a list of properties', () {
        expect(user.props, [
          user.userId,
          user.name,
        ]);
      });

      test('should be equal if all properties are equal', () {
        const user2 = User(
          userId: 'id',
          name: 'name',
        );

        expect(user, user2);
      });

      test('should be different if any property is different', () {
        const review2 = User(
          userId: 'id2',
          name: 'name2',
        );

        expect(user != review2, true);
      });
    });
  });
}
