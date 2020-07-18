import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

import 'core/networking/api_provider.dart';
import 'core/networking/auth_plugin.dart';
import 'core/networking/network_info.dart';
import 'core/networking/plugin_type.dart';
import 'features/account/data/datasources/auth_local_data_source.dart';
import 'features/account/data/datasources/auth_remote_data_source.dart';
import 'features/account/data/datasources/user_remote_data_source.dart';
import 'features/account/data/repositories/auth_repository_impl.dart';
import 'features/account/data/repositories/local/auth_local_repository.dart';
import 'features/account/data/repositories/remote/auth_remote_repository.dart';
import 'features/account/data/repositories/remote/user_remote_repository.dart';
import 'features/account/data/repositories/user_repository_impl.dart';
import 'features/account/domain/repositories/auth_repository.dart';
import 'features/account/domain/repositories/user_repository.dart';
import 'features/account/domain/usecases/authorized_usecase.dart';
import 'features/account/domain/usecases/get_member_usecase.dart';
import 'features/account/domain/usecases/login_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Account

  // Use cases
  sl.registerLazySingleton(() => AuthorizedUseCase(sl()));
  sl.registerLazySingleton(() => GetMemberUseCase(sl()));
  sl.registerLazySingleton(() => LoginUseCase(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      localDataSource: sl(),
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));

  // Data sources
  sl.registerLazySingleton<AuthLocalDataSource>(() => AuthLocalRepository());
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteRepository(DuoApiProvider(sl())));
  sl.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteRepository(DuoApiProvider(sl(), [sl()])));

  //! Core
  sl.registerLazySingleton<PluginType>(() => AuthPlugin(sl()));
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  sl.registerLazySingleton(() => Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
