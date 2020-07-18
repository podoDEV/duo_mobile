import '../../../../../core/networking/api_provider.dart';
import '../../../domain/entities/auth_provider.dart';
import '../../datasources/auth_remote_data_source.dart';
import 'models/request/login_request_model.dart';
import 'models/response/login_response_model.dart';
import 'requests/login_request.dart';

class AuthRemoteRepository implements AuthRemoteDataSource {
  final ApiProviderProtocol provider;

  AuthRemoteRepository(this.provider);

  @override
  Future<String> login(String authId, AuthProvider authProvider) async {
    final requestModel =
        LoginRequestModel(authId: authId, provider: authProvider);
    final response = await provider.send(LoginRequest(requestModel));
    return LoginResponseModel.fromMap(response).accessToken;
  }
}
