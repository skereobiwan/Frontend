//import 'package:skere_app/domain/model/user_stamp.dart';
import 'package:equatable/equatable.dart';

class UserStampEntity extends Equatable {
  final String stampid;
  final String stampModelid;
  final String userid;
  final String state;

  const UserStampEntity({
    required this.stampid,
    required this.stampModelid,
    required this.userid,
    required this.state,
  });

  @override
  List<Object> get props {
    return [stampid, stampModelid, userid,state];
  }
}