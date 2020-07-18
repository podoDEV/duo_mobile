import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/member.dart';

abstract class UserRepository {
  Future<Either<Failure, Member>> me();
  Future<Either<Failure, Member>> memberBy({String id});
}
