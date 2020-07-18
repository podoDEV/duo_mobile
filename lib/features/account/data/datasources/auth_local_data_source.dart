abstract class AuthLocalDataSource {
  Future<void> saveToken(String accessToken);

  /// Get the cached [String: accessToken] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<String> loadToken();
}
