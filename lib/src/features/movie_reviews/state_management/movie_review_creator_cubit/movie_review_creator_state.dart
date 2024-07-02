part of 'movie_review_creator_cubit.dart';

abstract class MovieReviewCreatorState extends Equatable {
  const MovieReviewCreatorState();
}

class MovieReviewCreatorInitial extends MovieReviewCreatorState {
  const MovieReviewCreatorInitial();
  @override
  List<Object> get props => [];
}

class MovieReviewCreatorLoading extends MovieReviewCreatorState {
  const MovieReviewCreatorLoading();
  @override
  List<Object> get props => [];
}

class MovieReviewCreatorLoaded extends MovieReviewCreatorState {
  const MovieReviewCreatorLoaded();
  @override
  List<Object> get props => [];
}

class MovieReviewCreatorFailed extends MovieReviewCreatorState {
  final AppException exception;
  const MovieReviewCreatorFailed(this.exception);
  @override
  List<Object> get props => [exception];
}
