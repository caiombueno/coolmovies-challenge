import 'package:coolmovies/src/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MovieDirector', () {
    group('Equatable', () {
      const director = MovieDirector(
        directorId: 'id',
        name: 'name',
      );

      test('props should return a list of properties', () {
        expect(director.props, [
          director.directorId,
          director.name,
        ]);
      });

      test('should be equal if all properties are equal', () {
        const user2 = MovieDirector(
          directorId: 'id',
          name: 'name',
        );
        expect(director, user2);
      });

      test('should be different if any property is different', () {
        const review2 = MovieDirector(
          directorId: 'id2',
          name: 'name2',
        );

        expect(director != review2, true);
      });
    });
  });
}
