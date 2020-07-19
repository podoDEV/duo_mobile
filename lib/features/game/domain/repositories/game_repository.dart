import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/game_category.dart';
import '../entities/room.dart';
import '../usecases/create_room_usecase.dart';
import '../usecases/get_room_usecase.dart';
import '../usecases/get_rooms_usecase.dart';

abstract class GameRepository {
  Future<Either<Failure, List<GameCategory>>> categories();
  Future<Either<Failure, List<Room>>> rooms(RoomsGetParams params);
  Future<Either<Failure, Room>> roomBy(String id);
  Future<Either<Failure, Room>> newRoom(RoomCreateParams params);
}
