import '../../../../../../../core/networking/mappable.dart';
import '../../../../../domain/usecases/update_member_usecase.dart';

class MemberPutRequestModel extends RequestMappable {
  final MemberUpdateParams params;

  MemberPutRequestModel({this.params});

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = new Map();
    if (params.nickname != null) {
      map['nickname'] = params.nickname;
    }
    return map;
  }
}
