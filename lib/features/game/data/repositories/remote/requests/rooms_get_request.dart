import '../../../../../../core/constants.dart';
import '../../../../../../core/models/base_request.dart';
import '../../../../../../core/networking/content_encoding.dart';
import '../../../../../../core/networking/http_method.dart';
import '../models/request/rooms_get_request_model.dart';

class RoomsGetRequest extends BaseRequest {
  final RoomsGetRequestModel requestModel;

  RoomsGetRequest(this.requestModel);

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
  String get path => '/rooms';
}
