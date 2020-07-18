import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/member.dart';
import '../repositories/user_repository.dart';

class GetMemberUseCase implements UseCase<Member, MemberGetParams> {
  final UserRepository repository;

  GetMemberUseCase(this.repository);

  @override
  Future<Either<Failure, Member>> call(MemberGetParams params) async {
    return await repository.memberBy(id: params.memberId);
  }
}

class MemberGetParams {
  final String memberId;

  MemberGetParams(this.memberId);
}
