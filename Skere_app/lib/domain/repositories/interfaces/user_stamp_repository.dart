import 'package:skere_app/core/error/failures.dart';
import 'package:skere_app/domain/model/user_stamp.dart';
//import 'package:skere_app/domain/model/task.dart';

import "package:dartz/dartz.dart";

abstract class UserStampRepository {
  Future<Either<Failure, List<UserStamp>>> getAllUserStamps();
  Future<Either<Failure, UserStamp>> getUserStamp(String userid,String stampid);
  Future<Either<Failure, Unit>> createUserStamp(UserStamp data);
  Future<Either<Failure, Unit>> deleteUserStamp(String userid,String stampid);
  Future<Either<Failure, Unit>> updateUserStamp(
      String stampid,
      String userid, {
      String? state,
  });
}
 