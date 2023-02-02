import 'package:skere_app/data/entities/user_stamp_entity.dart';
import 'package:dartz/dartz.dart';

abstract class UserStampDataSource {
  Future<List<UserStampEntity>> find({
    String stampid,
    String stampModelid,
    String userid,
    String state,
  });
  Future<UserStampEntity> findOne(String userid,String stampid);
  Future<Unit> create(UserStampEntity data);
  Future<Unit> delete(String userid,String stampid);
  Future<Unit> update(
    String stampid, String? userid, {
    String? stampModelid,
    String? state,
  });
}
