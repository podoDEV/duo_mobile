import 'package:Duo/core/networking/mappable.dart';

class MemberGetRequestModel extends RequestMappable {
  final String memberId;

  MemberGetRequestModel({this.memberId});

  @override
  Map<String, dynamic> toJson() => {};
}
