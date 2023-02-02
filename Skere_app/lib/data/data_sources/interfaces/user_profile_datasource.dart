import 'package:skere_app/data/entities/user_profile_entity.dart';
import 'package:dartz/dartz.dart';

abstract class UserProfileDataSource {
  Future<List<UserProfileEntity>> find({
    String userid,
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
  Future<UserProfileEntity> findOne(String userid);
  Future<Unit> create(UserProfileEntity data);
  Future<Unit> delete(String userid);
  Future<Unit> update(
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
