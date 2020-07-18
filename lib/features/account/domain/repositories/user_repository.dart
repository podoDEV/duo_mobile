import 'package:Duo/features/account/domain/entities/auth_provider.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class UserRepository {
  String get accessToken;

  Future<Either<Failure, void>> login(
      {String authId, AuthProvider authProvider});
}
