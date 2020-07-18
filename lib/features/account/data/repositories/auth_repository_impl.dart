import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/networking/network_info.dart';
import '../../domain/entities/auth_provider.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_data_source.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource localDataSource;
  final AuthRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  String accessToken;

  AuthRepositoryImpl({
    @required this.localDataSource,
    @required this.remoteDataSource,
    @required this.networkInfo,
  }) {
    localDataSource.loadToken();
  }

  @override
  Future<Either<Failure, void>> load() async {
    try {
      final accessToken = await localDataSource.loadToken();
      this.accessToken = accessToken;
      return Right(null);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> login(
      {String authId, AuthProvider authProvider}) async {
    try {
      verifyForOnline();
      final accessToken = await remoteDataSource.login(authId, authProvider);
      this.accessToken = accessToken;
      localDataSource.saveToken(accessToken);
      return Right(null);
    } on NetworkException {
      return Left(NetworkFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  void verifyForOnline() async {
    if (!await networkInfo.isConnected) {
      throw NetworkException();
    }
  }
}
