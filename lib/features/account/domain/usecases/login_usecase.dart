import 'package:Duo/features/account/domain/entities/auth_provider.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/user_repository.dart';

class LoginUseCase implements UseCase<void, LoginParams> {
  final UserRepository repository;

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
