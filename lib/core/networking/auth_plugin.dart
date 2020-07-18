import 'http_request.dart';
import 'plugin_type.dart';

class AuthPlugin implements PluginType {
  // UserRepository _userRepository;

  // AuthPlugin(this._userRepository);

  @override
  HttpRequestProtocol prepare(HttpRequestProtocol request) {
    // var accessToken = _userRepository.accessToken;
    // if (accessToken != null && accessToken.isNotEmpty) {
    //   request.putAdditionalHeader(
    //       HTTPHeader("Authorization", "bearer $accessToken"));
    // }
    return request;
  }
}
