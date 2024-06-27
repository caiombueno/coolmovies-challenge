import 'package:coolmovies/src/models/movie_summary.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MovieSummary', () {
    const id = '1';
    const title = 'Inception';
    const imgUrl = 'https://example.com/inception.jpg';
    const releaseDate = '2010-07-16';
    group('fromJson/toJson', () {
      test('should deserialize from JSON', () {
        final json = {
          'id': id,
          'title': title,
          'imgUrl': imgUrl,
          'releaseDate': releaseDate
        };

        final movie = MovieSummary.fromJson(json);

        expect(movie.id, id);
        expect(movie.title, title);
        expect(movie.imgUrl, imgUrl);
        expect(movie.releaseDate, releaseDate);
      });

      test('should serialize to JSON', () {
        const movie = MovieSummary(
          id: id,
          title: title,
          imgUrl: imgUrl,
          releaseDate: releaseDate,
        );

        final json = movie.toJson();

        expect(json['id'], id);
        expect(json['title'], title);
        expect(json['imgUrl'], imgUrl);
        expect(json['releaseDate'], releaseDate);
      });
    });

    group('Equatable', () {
      test('props should return a list of properties', () {
        const movie = MovieSummary(
          id: id,
          title: title,
          imgUrl: imgUrl,
          releaseDate: releaseDate,
        );

        expect(movie.props, [id, title, imgUrl, releaseDate]);
      });

      test('should be equal if all properties are equal', () {
        const movie1 = MovieSummary(
          id: id,
          title: title,
          imgUrl: imgUrl,
          releaseDate: releaseDate,
        );
        const movie2 = MovieSummary(
          id: id,
          title: title,
          imgUrl: imgUrl,
          releaseDate: releaseDate,
        );

        expect(movie1, movie2);
      });

      test('should be different if any property is different', () {
        const movie1 = MovieSummary(
          id: id,
          title: title,
          imgUrl: imgUrl,
          releaseDate: releaseDate,
        );
        const movie2 = MovieSummary(
          id: '2',
          title: title,
          imgUrl: imgUrl,
          releaseDate: releaseDate,
        );

        expect(movie1 != movie2, true);
      });
    });
  });
}
