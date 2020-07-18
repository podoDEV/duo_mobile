import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/member.dart';
import '../repositories/user_repository.dart';

class UpdateMemberUseCase implements UseCase<Member, MemberUpdateParams> {
  final UserRepository repository;

  UpdateMemberUseCase(this.repository);

  @override
  Future<Either<Failure, Member>> call(MemberUpdateParams params) async {
    return await repository.updateMember(params: params);
  }
}

class MemberUpdateParams {
  final String nickname;

  MemberUpdateParams(this.nickname);
}
