import '../../domain/entities/member.dart';

abstract class UserRemoteDataSource {
  /// Calls the /api/members/me endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<Member> me();

  /// Calls the /api/members/{memberId} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<Member> getMemberBy(String memberId);
}
