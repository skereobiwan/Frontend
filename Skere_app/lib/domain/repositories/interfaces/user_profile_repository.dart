import 'package:skere_app/core/error/failures.dart';
import 'package:skere_app/domain/model/user_profile.dart';

import "package:dartz/dartz.dart";

abstract class UserProfileRepository {
  Future<Either<Failure, List<UserProfile>>> getAllUserProfiles();
  Future<Either<Failure, UserProfile>> getUserProfile(String userid);
  Future<Either<Failure, Unit>> createUserProfile(UserProfile data);
  Future<Either<Failure, Unit>> deleteUserProfile(String id);
  Future<Either<Failure, Unit>> updateUserProfile(
    String userid, {
    String? title,
    String firstName,
    String lastName,
    String role,
    String gender,
    DateTime birthday,
    String? avatar,
    String documentType,
    double documentNumber,
    String? documentPictureFront,
    String? documentPictureBack,
    bool renaperValid,
  });
}


