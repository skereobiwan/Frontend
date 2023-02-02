import 'package:skere_app/data/data_sources/interfaces/user_stamp_datasource.dart';
import 'package:skere_app/data/entities/user_stamp_entity.dart';
import 'package:skere_app/domain/model/user_stamp.dart';
import 'package:skere_app/domain/repositories/interfaces/user_stamp_repository.dart';
import 'package:skere_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class UserStampRepositoryImpl implements UserStampRepository {
  UserStampDataSource userStampDataSource;
  UserStampRepositoryImpl(this.userStampDataSource);

  @override
  Future<Either<Failure, Unit>> createUserStamp(UserStamp data) async {
    try {
      final result = await userStampDataSource.create(UserStampEntity(
      stampid:data.stampid,
      stampModelid:data.stampModelid,
      userid:data.userid,
      state:data.state,
      ));
      return Right(result);
    } catch (e) {
      debugPrint(e.toString());
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteUserStamp(String userid,String stampid) async {
    try {
      final result = await userStampDataSource.delete(userid,stampid);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<UserStamp>>> getAllUserStamps() async {
    try {
      List<UserStampEntity> result = await userStampDataSource.find();
      return Right(result
          .map((e) => UserStamp(
                stampid:e.stampid,
                stampModelid:e.stampModelid,
                userid:e.userid,
                state:e.state,
              ))
          .toList());
    } catch (e) {
      debugPrint(e.toString());
      return Left(ServerFailure());
    }
  }

 @override
  Future<Either<Failure, UserStamp>> getUserStamp(String userid,String stampid) async {
    try {
      final result = await userStampDataSource.findOne(userid,stampid);
      return Right(UserStamp(
        stampid:result.stampid,
        stampModelid:result.stampModelid,
        userid:result.userid,
        state:result.state,
      ));
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> updateUserStamp(
      String stampid,
      String? userid,{
      String? state,
   }) async {
    try {
      final result = await userStampDataSource.update(stampid,userid, state: state);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
 
}
