import '../../../../../../core/constants.dart';
import '../../../../../../core/models/base_request.dart';
import '../../../../../../core/networking/content_encoding.dart';
import '../../../../../../core/networking/http_method.dart';
import '../models/request/member_get_request_model.dart';

class MemberGetRequest extends BaseRequest {
  final MemberGetRequestModel requestModel;

  MemberGetRequest(this.requestModel);

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
  HttpMethod get method => HttpMethod.GET;

  @override
  Map<String, dynamic> get parameters => requestModel.toJson();

  @override
  String get path => '/members/${requestModel.memberId}';
}
