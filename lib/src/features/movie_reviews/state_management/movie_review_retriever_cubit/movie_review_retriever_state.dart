part of 'movie_review_retriever_cubit.dart';

abstract class MovieReviewRetrieverState extends Equatable {
  const MovieReviewRetrieverState();
}

class MovieReviewsRetrieverLoading extends MovieReviewRetrieverState {
  const MovieReviewsRetrieverLoading();
  @override
  List<Object> get props => [];
}

class MovieReviewsRetrieverLoaded extends MovieReviewRetrieverState {
  final MovieReviewList reviewList;
  const MovieReviewsRetrieverLoaded(this.reviewList);
  @override
  List<Object> get props => [reviewList];
}

class MovieReviewsRetrieverFailed extends MovieReviewRetrieverState {
  final AppException exception;
  const MovieReviewsRetrieverFailed(this.exception);
  @override
  List<Object> get props => [exception];
}
