import 'package:coolmovies/src/l10n/l10n.dart';
import 'package:flutter/material.dart';

abstract class AppException implements Exception {
  const AppException(this.code);

  final String code;

  String getMessage(BuildContext context);
}

abstract class DataException extends AppException {
  const DataException(String code) : super(code);
}

class QueryFailureException extends DataException {
  const QueryFailureException() : super('query-failure');

  @override
  String getMessage(BuildContext context) =>
      context.l10n.queryFailureExceptionMessage;
}

class EmptyResultException extends DataException {
  const EmptyResultException() : super('empty-result');

  @override
  String getMessage(BuildContext context) =>
      context.l10n.emptyResultExceptionMessage;
}

class DataFormatFailureException extends DataException {
  const DataFormatFailureException() : super('data-format-failure');

  @override
  String getMessage(BuildContext context) =>
      context.l10n.dataFormatFailureExceptionMessage;
}

class NoMovieSummaryListFoundException extends DataException {
  const NoMovieSummaryListFoundException()
      : super('no-movie-summary-list-found');

  @override
  String getMessage(BuildContext context) =>
      context.l10n.noMovieSummaryListFoundExceptionMessage;
}

class MovieSummaryListFetchFailureException extends DataException {
  const MovieSummaryListFetchFailureException()
      : super('movie-summary-list-fetch-failure');

  @override
  String getMessage(BuildContext context) =>
      context.l10n.movieSummaryListFetchFailureExceptionMessage;
}

class NoMovieDetailsFoundException extends DataException {
  const NoMovieDetailsFoundException() : super('no-movie-details-found');

  @override
  String getMessage(BuildContext context) =>
      context.l10n.noMovieDetailsFoundExceptionMessage;
}

class MovieDetailsFetchFailureException extends DataException {
  const MovieDetailsFetchFailureException()
      : super('movie-details-fetch-failure');

  @override
  String getMessage(BuildContext context) =>
      context.l10n.movieDetailsFetchFailureExceptionMessage;
}
