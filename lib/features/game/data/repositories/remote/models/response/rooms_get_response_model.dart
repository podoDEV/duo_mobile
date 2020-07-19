import '../../../../../domain/entities/room.dart';

class RoomsGetResponseModel {
  List<Room> rooms;

  RoomsGetResponseModel({this.rooms});

  factory RoomsGetResponseModel.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    return new RoomsGetResponseModel(
        rooms: list.map((e) => Room.fromMap(e)).toList());
  }
}
