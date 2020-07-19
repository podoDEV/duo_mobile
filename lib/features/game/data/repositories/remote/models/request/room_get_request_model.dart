import '../../../../../../../core/networking/mappable.dart';

class RoomGetRequestModel extends RequestMappable {
  final String id;

  RoomGetRequestModel({this.id});

  @override
  Map<String, dynamic> toJson() => {};
}
