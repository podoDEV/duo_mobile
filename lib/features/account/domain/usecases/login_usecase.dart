import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/auth_provider.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase implements UseCase<void, LoginParams> {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(LoginParams loginParams) async {
    return await repository.login(
        authId: loginParams.authId, authProvider: loginParams.provider);
  }
}

class LoginParams {
  String authId;
  AuthProvider provider;
}
