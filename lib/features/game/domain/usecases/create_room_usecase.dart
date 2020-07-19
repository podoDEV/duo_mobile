import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../account/domain/entities/member.dart';
import '../entities/game_category.dart';
import '../entities/room.dart';
import '../repositories/game_repository.dart';

class CreateRoomUseCase implements UseCase<Room, RoomCreateParams> {
  final GameRepository repository;

  CreateRoomUseCase(this.repository);

  @override
  Future<Either<Failure, Room>> call(RoomCreateParams params) async {
    return await repository.newRoom(params);
  }
}

class RoomCreateParams {
  String title;
  GameCategory category;
  String meetAt;
  Member owner;
  String password;

  RoomCreateParams(
      {this.title, this.category, this.meetAt, this.owner, this.password});
}
