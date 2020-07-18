import '../../../../../../core/constants.dart';
import '../../../../../../core/models/base_request.dart';
import '../../../../../../core/networking/content_encoding.dart';
import '../../../../../../core/networking/http_method.dart';
import '../models/request/member_put_request_model.dart';

class MemberPutRequest extends BaseRequest {
  final MemberPutRequestModel requestModel;

  MemberPutRequest(this.requestModel);

  @override
  String get baseUrl => Constants.baseUrl;

  @override
  ContentEncoding get contentEncoding => ContentEncoding.url;

  @override
  Map<String, String> get headers => {
        "content-type": "application/json",
        "accept": "*/*",
      };

  @override
  HttpMethod get method => HttpMethod.PUT;

  @override
  Map<String, dynamic> get parameters => requestModel.toJson();

  @override
  String get path => '/members/me';
}
