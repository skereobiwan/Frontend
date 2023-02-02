import 'package:skere_app/core/error/failures.dart';
import 'package:skere_app/domain/model/user_album.dart';

import "package:dartz/dartz.dart";

abstract class UserAlbumRepository {
  Future<Either<Failure, List<UserAlbum>>> getAllUserAlbums();
  Future<Either<Failure, UserAlbum>> getUserAlbum(String albumid);
  Future<Either<Failure, Unit>> createUserAlbum(UserAlbum data);
  Future<Either<Failure, Unit>> deleteUserAlbum(String albumid);
  Future<Either<Failure, Unit>> updateUserAlbum(
      String albumid,{
      String albumModelid,
      String userid,
      String title,
  });
}
 