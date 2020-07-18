import 'package:Duo/features/account/domain/entities/auth_provider.dart';

import '../../../../../../../core/networking/mappable.dart';

class LoginRequestModel extends RequestMappable {
  final String authId;
  final AuthProvider provider;

  LoginRequestModel({this.authId, this.provider});

  @override
  Map<String, dynamic> toJson() => {
        'authId': authId,
        'provider': provider.toString(),
      };
}
