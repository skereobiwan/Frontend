import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';


@immutable
class UserStamp extends Equatable {
  final String stampid;
  final String stampModelid;
  final String userid;
  final String state;

  const UserStamp({
    required this.stampid,
    required this.stampModelid,
    required this.userid,
    required this.state,
  });

  dynamic toJson() => {
        'stampid': stampid,
        'stampModelid': stampModelid,
        'userid':userid,
        'state': state,
      };

  @override
  String toString() {
    return toJson().toString();
  }

  @override
  List<Object> get props {
    return [stampid, stampModelid, userid,state];
  }
}