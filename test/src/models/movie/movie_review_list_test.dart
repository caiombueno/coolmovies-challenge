import 'package:flutter_test/flutter_test.dart';
import 'package:coolmovies/src/models/models.dart';

void main() {
  group('MovieReviewList', () {
    group('Equatable', () {
      const reviewList = MovieReviewList(
        movieId: 'movieId',
        reviews: [MovieReview(reviewId: 'reviewId', title: 'title')],
      );

      test('props should return a list of properties', () {
        expect(reviewList.props, [
          reviewList.movieId,
          reviewList.reviews,
        ]);
      });

      test('should be equal if all properties are equal', () {
        const reviewList1 = MovieReviewList(
          movieId: 'movieId',
          reviews: [MovieReview(reviewId: 'reviewId', title: 'title')],
        );
        expect(reviewList, reviewList1);
      });

      test('should be different if any property is different', () {
        const reviewList1 = MovieReviewList(
          movieId: 'movieId1',
          reviews: [MovieReview(reviewId: 'reviewId', title: 'title')],
        );

        expect(reviewList != reviewList1, true);
      });
    });
  });
}
