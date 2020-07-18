import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/member.dart';
import '../repositories/user_repository.dart';

class GetMemberUseCase implements UseCase<Member, GetMemberParams> {
  final UserRepository repository;

  GetMemberUseCase(this.repository);

  @override
  Future<Either<Failure, Member>> call(GetMemberParams params) async {
    return await repository.memberBy(id: params.memberId);
  }
}

class GetMemberParams {
  final String memberId;

  GetMemberParams(this.memberId);
}
