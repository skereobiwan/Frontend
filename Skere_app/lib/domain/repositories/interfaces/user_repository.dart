import 'package:skere_app/core/error/failures.dart';
import 'package:skere_app/domain/model/user.dart';
//import 'package:skere_app/domain/model/task.dart';

import "package:dartz/dartz.dart";

abstract class UserRepository {
  Future<Either<Failure, List<User>>> getAllUsers();
  Future<Either<Failure, User>> getUser(String userid);
  Future<Either<Failure, Unit>> createUser(User data);
  Future<Either<Failure, Unit>> deleteUser(String userid);
  Future<Either<Failure, Unit>> updateUser(
      String userid, {
      String? emailAddress,
      String? passwordHash,
      bool? userValid,
  });
}

   