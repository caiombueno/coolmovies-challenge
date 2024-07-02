import 'package:coolmovies/src/l10n/l10n.dart';
import 'package:coolmovies/src/models/exceptions/app_exception.dart';
import 'package:flutter/material.dart';

abstract class DomainException extends AppException {
  const DomainException(String code) : super(code);

  String getMessage(BuildContext context);
}

class NoMovieSummaryListFoundException extends DomainException {
  const NoMovieSummaryListFoundException()
      : super('no-movie-summary-list-found');

  @override
  String getMessage(BuildContext context) =>
      context.l10n.noMovieSummaryListFoundExceptionMessage;
}

class MovieSummaryListFetchFailureException extends DomainException {
  const MovieSummaryListFetchFailureException()
      : super('movie-summary-list-fetch-failure');

  @override
  String getMessage(BuildContext context) =>
      context.l10n.movieSummaryListFetchFailureExceptionMessage;
}

class NoMovieDetailsFoundException extends DomainException {
  const NoMovieDetailsFoundException() : super('no-movie-details-found');

  @override
  String getMessage(BuildContext context) =>
      context.l10n.noMovieDetailsFoundExceptionMessage;
}

class MovieDetailsFetchFailureException extends DomainException {
  const MovieDetailsFetchFailureException()
      : super('movie-details-fetch-failure');

  @override
  String getMessage(BuildContext context) =>
      context.l10n.movieDetailsFetchFailureExceptionMessage;
}

class NoMovieReviewsFoundException extends DomainException {
  const NoMovieReviewsFoundException() : super('no-movie-reviews-found');

  @override
  String getMessage(BuildContext context) =>
      context.l10n.noMovieReviewsFoundExceptionMessage;
}

class MovieReviewsFetchFailureException extends DomainException {
  const MovieReviewsFetchFailureException()
      : super('movie-reviews-fetch-failure');

  @override
  String getMessage(BuildContext context) =>
      context.l10n.movieReviewsFetchFailureExceptionMessage;
}

class MovieReviewCreationFailureException extends DomainException {
  const MovieReviewCreationFailureException()
      : super('movie-review-creation-failure');

  @override
  String getMessage(BuildContext context) =>
      context.l10n.movieReviewCreationFailureExceptionMessage;
}
