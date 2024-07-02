import 'package:coolmovies/src/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MovieDetails', () {
    group('Equatable', () {
      const details = MovieDetails(
        movieId: 'id',
        title: 'title',
        imgUrl: 'imgUrl',
        releaseDate: 'releaseDate',
        director: MovieDirector(directorId: 'directorId'),
      );

      test('props should return a list of properties', () {
        expect(details.props, [
          details.movieId,
          details.title,
          details.imgUrl,
          details.releaseDate,
          details.director,
        ]);
      });

      test('should be equal if all properties are equal', () {
        const details2 = MovieDetails(
          movieId: 'id',
          title: 'title',
          imgUrl: 'imgUrl',
          releaseDate: 'releaseDate',
          director: MovieDirector(directorId: 'directorId'),
        );
        expect(details, details2);
      });

      test('should be different if any property is different', () {
        const details2 = MovieDetails(
          movieId: 'id2',
          title: 'title',
          imgUrl: 'imgUrl',
          releaseDate: 'releaseDate',
          director: MovieDirector(directorId: 'directorId'),
        );

        expect(details != details2, true);
      });
    });
  });
}
