import '../../../../../core/networking/api_provider.dart';
import '../../../domain/entities/member.dart';
import '../../../domain/usecases/update_member_usecase.dart';
import '../../datasources/user_remote_data_source.dart';
import 'models/request/member_get_request_model.dart';
import 'models/request/member_put_request_model.dart';
import 'requests/member_get_request.dart';
import 'requests/member_put_request.dart';
import 'requests/members_me_get_request.dart';

class UserRemoteRepository implements UserRemoteDataSource {
  final ApiProviderProtocol provider;

  UserRemoteRepository(this.provider);

  @override
  Future<Member> me() async {
    final response = await provider.send(MembersMeGetRequest());
    return Member.fromMap(response);
  }

  @override
  Future<Member> getMemberBy(String memberId) async {
    final requestModel = MemberGetRequestModel(memberId: memberId);
    final response = await provider.send(MemberGetRequest(requestModel));
    return Member.fromMap(response);
  }

  @override
  Future<Member> updateMember(MemberUpdateParams params) async {
    final requestModel = MemberPutRequestModel(params: params);
    final response = await provider.send(MemberPutRequest(requestModel));
    return Member.fromMap(response);
  }
}
