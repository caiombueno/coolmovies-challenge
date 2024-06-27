import 'package:coolmovies/src/l10n/l10n.dart';
import 'package:flutter/material.dart';

abstract class AppException implements Exception {
  const AppException(this.code);

  final String code;

  String getMessage(BuildContext context);
}

class FetchDataFailureException extends AppException {
  const FetchDataFailureException() : super('fetch-data-failure');

  @override
  String getMessage(BuildContext context) =>
      context.l10n.fetchDataFailureExceptionMessage;
}

class NoDataFoundException extends AppException {
  const NoDataFoundException() : super('no-data-found');

  @override
  String getMessage(BuildContext context) =>
      context.l10n.noDataFoundExceptionMessage;
}
