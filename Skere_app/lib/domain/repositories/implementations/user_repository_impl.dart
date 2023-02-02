import 'package:skere_app/data/data_sources/interfaces/user_datasource.dart';
import 'package:skere_app/data/entities/user_entity.dart';
import 'package:skere_app/domain/model/user.dart';
import 'package:skere_app/domain/repositories/interfaces/user_repository.dart';
import 'package:skere_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class UserRepositoryImpl implements UserRepository {
  UserDataSource userDataSource;
  UserRepositoryImpl(this.userDataSource);

  @override
  Future<Either<Failure, Unit>> createUser(User data) async {
    try {
      final result = await userDataSource.create(UserEntity(
        userid: data.userid,
        emailAddress: data.emailAddress,
        passwordHash: data.passwordHash,
        userValid: data.userValid,
      ));
      return Right(result);
    } catch (e) {
      debugPrint(e.toString());
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteUser(String userid) async {
    try {
      final result = await userDataSource.delete(userid);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<User>>> getAllUsers() async {
    try {
      List<UserEntity> result = await userDataSource.find();
      return Right(result
          .map((e) => User(
                userid: e.userid,
                emailAddress: e.emailAddress,
                passwordHash: e.passwordHash,
                userValid: e.userValid,
              ))
          .toList());
    } catch (e) {
      debugPrint(e.toString());
      return Left(ServerFailure());
    }
  }

 @override
  Future<Either<Failure, User>> getUser(String userid) async {
    try {
      final result = await userDataSource.findOne(userid);
      return Right(User(
        userid: result.userid,
        emailAddress: result.emailAddress,
        passwordHash: result.passwordHash,
        userValid: result.userValid,
      ));
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> updateUser(
    String userid, {
    String? emailAddress,
    String? passwordHash,
    bool? userValid,
   }) async {
    try {
      final result = await userDataSource.update(userid, emailAddress: emailAddress, passwordHash: passwordHash, userValid: userValid);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
 
}
