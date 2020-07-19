import '../../../../../core/networking/api_provider.dart';
import '../../../domain/entities/game_category.dart';
import '../../../domain/entities/room.dart';
import '../../../domain/usecases/create_room_usecase.dart';
import '../../../domain/usecases/get_rooms_usecase.dart';
import '../../datasources/game_remote_data_source.dart';
import 'models/request/room_get_request_model.dart';
import 'models/request/room_post_request_model.dart';
import 'models/request/rooms_get_request_model.dart';
import 'models/response/categories_get_response_model.dart';
import 'models/response/rooms_get_response_model.dart';
import 'requests/categories_get_request.dart';
import 'requests/room_get_request.dart';
import 'requests/room_post_request.dart';
import 'requests/rooms_get_request.dart';

class GameRemoteRepository implements GameRemoteDataSource {
  final ApiProviderProtocol provider;

  GameRemoteRepository(this.provider);

  @override
  Future<Room> createRoom(RoomCreateParams params) async {
    final requestModel = RoomPostRequestModel.fromParams(params);
    final response = await provider.send(RoomPostRequest(requestModel));
    return Room.fromMap(response);
  }

  @override
  Future<List<GameCategory>> getCategories() async {
    final response = await provider.send(CategoriesGetRequest());
    return CategoriesGetResponseModel.fromJson(response).categories;
  }

  @override
  Future<Room> getRoomBy(String id) async {
    final requestModel = RoomGetRequestModel(id: id);
    final response = await provider.send(RoomGetRequest(requestModel));
    return Room.fromMap(response);
  }

  @override
  Future<List<Room>> getRooms(RoomsGetParams params) async {
    final requestModel = RoomsGetRequestModel.fromParams(params);
    final response = await provider.send(RoomsGetRequest(requestModel));
    return RoomsGetResponseModel.fromJson(response).rooms;
  }
}
