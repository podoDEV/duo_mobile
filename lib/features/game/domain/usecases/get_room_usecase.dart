import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/room.dart';
import '../repositories/game_repository.dart';

class GetRoomUseCase implements UseCase<Room, RoomGetParams> {
  final GameRepository repository;

  GetRoomUseCase(this.repository);

  @override
  Future<Either<Failure, Room>> call(RoomGetParams params) async {
    return await repository.roomBy(params.id);
  }
}

class RoomGetParams {
  String id;

  RoomGetParams({this.id});
}
