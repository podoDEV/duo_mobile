import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/game_category.dart';
import '../entities/room.dart';
import '../usecases/get_rooms_usecase.dart';

abstract class GameRepository {
  Future<Either<Failure, List<GameCategory>>> getCategories();
  Future<Either<Failure, List<Room>>> getRooms(RoomsGetParams params);
}
