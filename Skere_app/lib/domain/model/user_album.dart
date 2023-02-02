import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';


@immutable
class UserAlbum extends Equatable {
  final String albumid;
  final String albumModelid;
  final String userid;
  final String title;

  const UserAlbum({
    required this.albumid,
    required this.albumModelid,
    required this.userid,
    required this.title,
  });

  dynamic toJson() => {
        'albumid': albumid,
        'albumModelid': albumModelid,
        'userid':userid,
        'title': title,
      };

  @override
  String toString() {
    return toJson().toString();
  }

  @override
  List<Object> get props {
    return [albumid,albumModelid,userid,title];
  }
}