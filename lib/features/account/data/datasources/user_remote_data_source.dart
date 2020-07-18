import '../../domain/entities/member.dart';
import '../../domain/usecases/update_member_usecase.dart';

abstract class UserRemoteDataSource {
  /// Calls the 'GET' /api/members/me endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<Member> me();

  /// Calls the 'GET' /api/members/{memberId} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<Member> getMemberBy(String memberId);

  /// Calls the 'PUT' /api/members/me endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<Member> updateMember(MemberUpdateParams params);
}
