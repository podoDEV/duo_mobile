import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/util/logger.dart';
import '../../datasources/auth_local_data_source.dart';

class AuthLocalRepository implements AuthLocalDataSource {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Future<void> saveToken(String accessToken) async {
    (await _prefs).setString("accessToken", accessToken);
    return null;
  }

  @override
  Future<String> loadToken() async {
    final accessToken = (await _prefs).getString("accessToken");
    logger.d("exists accessToken : ${accessToken != null}");
    if (accessToken == null) {
      throw CacheException();
    }
    return accessToken;
  }
}
