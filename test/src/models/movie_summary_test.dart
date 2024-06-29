import 'package:coolmovies/src/models/movie_summary.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MovieSummary', () {
    const id = '1';
    const title = 'Inception';
    const imgUrl = 'https://example.com/inception.jpg';
    const ratingList = [5.0, 4.0];
    const overallRating = 4.5;

    group('Equatable', () {
      test('props should return a list of properties', () {
        const movie = MovieSummary(
          id: id,
          title: title,
          imgUrl: imgUrl,
          overallRating: overallRating,
        );

        expect(movie.props, [id, title, imgUrl, overallRating]);
      });

      test('should be equal if all properties are equal', () {
        const movie1 = MovieSummary(
          id: id,
          title: title,
          imgUrl: imgUrl,
          overallRating: overallRating,
        );
        const movie2 = MovieSummary(
          id: id,
          title: title,
          imgUrl: imgUrl,
          overallRating: overallRating,
        );

        expect(movie1, movie2);
      });

      test('should be different if any property is different', () {
        const movie1 = MovieSummary(
          id: id,
          title: title,
          imgUrl: imgUrl,
          overallRating: overallRating,
        );
        const movie2 = MovieSummary(
          id: '2',
          title: title,
          imgUrl: imgUrl,
          overallRating: overallRating,
        );

        expect(movie1 != movie2, true);
      });
    });

    group('fromRatingList', () {
      test('should calculate the overallRating correctly', () {
        // act
        final movieSummary = MovieSummary.fromRatingList(
          id: id,
          title: title,
          imgUrl: imgUrl,
          ratingList: ratingList,
        );

        // assert
        expect(movieSummary.overallRating, overallRating);
      });

      test('overallRating should be equals zero when ratingList is empty', () {
        // arrange
        final ratingList = <double>[];

        // act
        final movieSummary = MovieSummary.fromRatingList(
          id: id,
          title: title,
          imgUrl: imgUrl,
          ratingList: ratingList,
        );

        // assert
        expect(movieSummary.overallRating, 0.0);
      });
    });
  });
}
