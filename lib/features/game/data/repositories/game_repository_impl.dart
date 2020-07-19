import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/networking/network_info.dart';
import '../../domain/entities/game_category.dart';
import '../../domain/entities/room.dart';
import '../../domain/repositories/game_repository.dart';
import '../../domain/usecases/create_room_usecase.dart';
import '../../domain/usecases/get_room_usecase.dart';
import '../../domain/usecases/get_rooms_usecase.dart';
import '../datasources/game_remote_data_source.dart';

class GameRepositoryImpl implements GameRepository {
  final GameRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  List<GameCategory> cachedCategories = [];

  GameRepositoryImpl({
    @required this.remoteDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<GameCategory>>> categories() async {
    try {
      verifyForOnline();
      if (cachedCategories.isNotEmpty) {
        return Right(cachedCategories);
      }
      final categories = await remoteDataSource.getCategories();
      cachedCategories = categories;
      return Right(categories);
    } on NetworkException {
      return Left(NetworkFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Room>>> rooms(RoomsGetParams params) async {
    try {
      verifyForOnline();
      final rooms = await remoteDataSource.getRooms(params);
      return Right(rooms);
    } on NetworkException {
      return Left(NetworkFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Room>> roomBy(String id) async {
    try {
      verifyForOnline();
      final room = await remoteDataSource.getRoomBy(id);
      return Right(room);
    } on NetworkException {
      return Left(NetworkFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Room>> newRoom(RoomCreateParams params) async {
    try {
      verifyForOnline();
      final room = await remoteDataSource.createRoom(params);
      return Right(room);
    } on NetworkException {
      return Left(NetworkFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  void verifyForOnline() async {
    if (!await networkInfo.isConnected) {
      throw NetworkException();
    }
  }
}
