class DuoApiException implements Exception {
  String code;
  String message;

  DuoApiException(this.code, this.message);
}
