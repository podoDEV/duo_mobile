import '../../domain/entities/auth_provider.dart';

abstract class AuthRemoteDataSource {
  /// Calls the /api/login endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<String> login(String authId, AuthProvider authProvider);
}
