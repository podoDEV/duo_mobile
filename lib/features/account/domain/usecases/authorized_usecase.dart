import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

class AuthorizedUseCase implements UseCase<void, NoParams> {
  final AuthRepository repository;

  AuthorizedUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(NoParams loginParams) async {
    final response = await repository.load();
    return response.fold((l) => Left(Unauthorized()), (r) => Right(null));
  }
}
