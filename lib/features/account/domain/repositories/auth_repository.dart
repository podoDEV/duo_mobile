import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/auth_provider.dart';

abstract class AuthRepository {
  String get accessToken;

  Future<Either<Failure, void>> load();

  Future<Either<Failure, void>> login(
      {String authId, AuthProvider authProvider});
}
