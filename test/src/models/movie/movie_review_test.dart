import 'package:coolmovies/src/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MovieReview', () {
    group('Equatable', () {
      const review = MovieReview(
        reviewId: 'id',
        title: 'title',
        body: 'body',
        rating: 1.0,
        reviewer: User(userId: 'id'),
      );

      test('props should return a list of properties', () {
        expect(review.props, [
          review.reviewId,
          review.title,
          review.body,
          review.reviewer,
          review.rating,
        ]);
      });

      test('should be equal if all properties are equal', () {
        const review2 = MovieReview(
          reviewId: 'id',
          title: 'title',
          body: 'body',
          rating: 1.0,
          reviewer: User(userId: 'id'),
        );

        expect(review, review2);
      });

      test('should be different if any property is different', () {
        const review2 = MovieReview(
          reviewId: 'id2',
          title: 'title2',
          body: 'body2',
          rating: 2.0,
          reviewer: User(userId: 'id2'),
        );

        expect(review != review2, true);
      });
    });
  });
}
