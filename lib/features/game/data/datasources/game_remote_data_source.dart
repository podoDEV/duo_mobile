import '../../domain/entities/game_category.dart';
import '../../domain/entities/room.dart';
import '../../domain/usecases/create_room_usecase.dart';
import '../../domain/usecases/get_rooms_usecase.dart';

abstract class GameRemoteDataSource {
  /// Calls the 'GET' /api/categories endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<GameCategory>> getCategories();

  /// Calls the 'GET' /api/rooms endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<Room>> getRooms(RoomsGetParams params);

  Future<Room> getRoomBy(String id);

  /// Calls the 'POST' /api/rooms endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<Room> createRoom(RoomCreateParams params);
}
