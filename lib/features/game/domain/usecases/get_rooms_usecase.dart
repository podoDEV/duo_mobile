import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/game_category.dart';
import '../entities/room.dart';
import '../repositories/game_repository.dart';

class GetRoomsUseCase implements UseCase<List<Room>, RoomsGetParams> {
  final GameRepository repository;

  GetRoomsUseCase(this.repository);

  @override
  Future<Either<Failure, List<Room>>> call(RoomsGetParams params) async {
    return await repository.rooms(params);
  }
}

class RoomsGetParams {
  GameCategory category;
  int pageNumber;

  RoomsGetParams({this.category, this.pageNumber});
}
