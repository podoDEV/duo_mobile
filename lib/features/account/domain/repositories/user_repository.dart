import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/member.dart';
import '../usecases/update_member_usecase.dart';

abstract class UserRepository {
  Future<Either<Failure, Member>> me();
  Future<Either<Failure, Member>> memberBy({String id});
  Future<Either<Failure, Member>> updateMember({MemberUpdateParams params});
}
