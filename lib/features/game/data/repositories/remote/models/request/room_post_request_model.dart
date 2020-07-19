import '../../../../../../../core/networking/mappable.dart';
import '../../../../../domain/usecases/create_room_usecase.dart';

class RoomPostRequestModel extends RequestMappable {
  final String title;
  final String category;
  final String meetAt;
  final String owner;
  final String password;

  RoomPostRequestModel(
      {this.title, this.category, this.meetAt, this.owner, this.password});

  factory RoomPostRequestModel.fromParams(RoomCreateParams params) {
    return new RoomPostRequestModel(
        title: params.title,
        category: params.category.toString(),
        meetAt: params.meetAt,
        owner: params.owner.nickname,
        password: params.password);
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = new Map();
    map['title'] = title;
    map['category'] = category;
    map['meetAt'] = meetAt;
    map['owner'] = owner;
    if (password != null) {
      map['password'] = password;
    }
    return map;
  }
}
