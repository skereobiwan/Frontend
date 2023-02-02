import 'package:skere_app/data/entities/user_album_entity.dart';
import 'package:dartz/dartz.dart';

abstract class UserAlbumDataSource {
  Future<List<UserAlbumEntity>> find({
    String albumid,
    String albumModelid,
    String userid,
    String title,
  });
  Future<UserAlbumEntity> findOne(String albumid);
  Future<Unit> create(UserAlbumEntity data);
  Future<Unit> delete(String albumid);
  Future<Unit> update(
    String albumid, {
    String? albumModelid,
    String? userid,
    String? title,
  });
}
