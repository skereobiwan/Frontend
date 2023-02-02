import 'package:skere_app/data/data_sources/interfaces/user_album_datasource.dart';
import 'package:skere_app/data/entities/user_album_entity.dart';
import 'package:skere_app/domain/model/user_album.dart';
import 'package:skere_app/domain/repositories/interfaces/user_album_repository.dart';
import 'package:skere_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class UserAlbumRepositoryImpl implements UserAlbumRepository {
  UserAlbumDataSource userAlbumDataSource;
  UserAlbumRepositoryImpl(this.userAlbumDataSource);

  @override
  Future<Either<Failure, Unit>> createUserAlbum(UserAlbum data) async {
    try {
      final result = await userAlbumDataSource.create(UserAlbumEntity(
      albumid:data.albumid,
      albumModelid:data.albumModelid,
      userid:data.userid,
      title:data.title,
      ));
      return Right(result);
    } catch (e) {
      debugPrint(e.toString());
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteUserAlbum(String albumid) async {
    try {
      final result = await userAlbumDataSource.delete(albumid);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<UserAlbum>>> getAllUserAlbums() async {
    try {
      List<UserAlbumEntity> result = await userAlbumDataSource.find();
      return Right(result
          .map((e) => UserAlbum(
                albumid:e.albumid,
                albumModelid:e.albumModelid,
                userid:e.userid,
                title:e.title,
              ))
          .toList());
    } catch (e) {
      debugPrint(e.toString());
      return Left(ServerFailure());
    }
  }

 @override
  Future<Either<Failure, UserAlbum>> getUserAlbum(String albumid) async {
    try {
      final result = await userAlbumDataSource.findOne(albumid);
      return Right(UserAlbum(
        albumid:result.albumid,
        albumModelid:result.albumModelid,
        userid:result.userid,
        title:result.title,
      ));
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> updateUserAlbum(
      String albumid,{
      String? albumModelid,
      String? userid,
      String? title,
   }) async {
    try {
      final result = await userAlbumDataSource.update(albumid,albumModelid: albumModelid,userid:userid,title:title);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
 
}

/*
    required String albumid,
    required String albumModelid,
    required String userid,
    required String title,
   */
   
     