abstract class AppException implements Exception {
  const AppException(this.code);
  final String code;
}
