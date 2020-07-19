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
import 'features/account/domain/usecases/update_member_usecase.dart';
import 'features/game/data/datasources/game_remote_data_source.dart';
import 'features/game/data/repositories/game_repository_impl.dart';
import 'features/game/data/repositories/remote/game_remote_repository.dart';
import 'features/game/domain/repositories/game_repository.dart';
import 'features/game/domain/usecases/create_room_usecase.dart';
import 'features/game/domain/usecases/get_game_categories_usecase.dart';
import 'features/game/domain/usecases/get_room_usecase.dart';
import 'features/game/domain/usecases/get_rooms_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Game

  // Use cases
  sl.registerLazySingleton(() => GetGameCategoriesUseCase(sl()));
  sl.registerLazySingleton(() => GetRoomsUseCase(sl()));
  sl.registerLazySingleton(() => GetRoomUseCase(sl()));
  sl.registerLazySingleton(() => CreateRoomUseCase(sl()));

  // Repository
  sl.registerLazySingleton<GameRepository>(
      () => GameRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));

  // Data sources
  sl.registerLazySingleton<GameRemoteDataSource>(
      () => GameRemoteRepository(sl()));

  //! Features - Account

  // Use cases
  sl.registerLazySingleton(() => AuthorizedUseCase(sl()));
  sl.registerLazySingleton(() => GetMemberUseCase(sl()));
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => UpdateMemberUseCase(sl()));

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
      () => UserRemoteRepository(sl()));

  //! Core
  sl.registerLazySingleton<ApiProviderProtocol>(
      () => DuoApiProvider(sl(), [sl()]));
  sl.registerLazySingleton<PluginType>(() => AuthPlugin(sl()));
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  sl.registerLazySingleton(() => Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
