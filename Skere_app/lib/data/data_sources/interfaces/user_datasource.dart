import 'package:skere_app/data/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class UserDataSource {
  Future<List<UserEntity>> find({
    String? userid,
    String emailAddress,
    String passwordHash,
    bool userValid,
  });
  Future<UserEntity> findOne(String userid);
  Future<Unit> create(UserEntity data);
  Future<Unit> delete(String userid);
  Future<Unit> update(
    String userid, {
    String? emailAddress,
    String? passwordHash,
    bool? userValid,
  });
}
