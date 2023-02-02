import 'package:equatable/equatable.dart';

class UserAlbumEntity extends Equatable {
  final String albumid;
  final String albumModelid;
  final String userid;
  final String title;

  const UserAlbumEntity({
    required this.albumid,
    required this.albumModelid,
    required this.userid,
    required this.title,
  });

  @override
  List<Object> get props {
    return [albumid,albumModelid,userid,title];
  }
}
