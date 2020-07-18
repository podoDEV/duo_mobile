import '../../features/account/domain/repositories/auth_repository.dart';
import 'http_header.dart';
import 'http_request.dart';
import 'plugin_type.dart';

class AuthPlugin implements PluginType {
  AuthRepository _authRepository;

  AuthPlugin(this._authRepository);

  @override
  HttpRequestProtocol prepare(HttpRequestProtocol request) {
    var accessToken = _authRepository.accessToken;
    if (accessToken != null && accessToken.isNotEmpty) {
      request.putAdditionalHeader(
          HTTPHeader("Authorization", "bearer $accessToken"));
    }
    return request;
  }
}
