import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/networking/network_info.dart';
import '../../domain/entities/member.dart';
import '../../domain/repositories/user_repository.dart';
import '../../domain/usecases/update_member_usecase.dart';
import '../datasources/user_remote_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  UserRepositoryImpl({
    @required this.remoteDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, Member>> me() async {
    try {
      verifyForOnline();
      final me = await remoteDataSource.me();
      return Right(me);
    } on NetworkException {
      return Left(NetworkFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Member>> memberBy({String id}) async {
    try {
      verifyForOnline();
      final member = await remoteDataSource.getMemberBy(id);
      return Right(member);
    } on NetworkException {
      return Left(NetworkFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Member>> updateMember(
      {MemberUpdateParams params}) async {
    try {
      verifyForOnline();
      final member = await remoteDataSource.updateMember(params);
      return Right(member);
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
