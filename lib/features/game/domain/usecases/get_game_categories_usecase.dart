import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/game_category.dart';
import '../repositories/game_repository.dart';

class GetGameCategoriesUseCase
    implements UseCase<List<GameCategory>, NoParams> {
  final GameRepository repository;

  GetGameCategoriesUseCase(this.repository);

  @override
  Future<Either<Failure, List<GameCategory>>> call(NoParams params) async {
    return await repository.getCategories();
  }
}
