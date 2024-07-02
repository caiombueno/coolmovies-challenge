import 'package:coolmovies/src/models/exceptions/app_exception.dart';

abstract class DataException extends AppException {
  const DataException(String code) : super(code);
}

class ServerCommunicationFailureException extends DataException {
  const ServerCommunicationFailureException()
      : super('server-communication-failure');
}

class EmptyResultException extends DataException {
  const EmptyResultException() : super('empty-result');
}

class DataFormatFailureException extends DataException {
  const DataFormatFailureException() : super('data-format-failure');
}
