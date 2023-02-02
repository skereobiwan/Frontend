import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';


@immutable
class UserProfile extends Equatable {
  final String userid;
  final String? title;
  final String firstName;
  final String lastName;
  final String role;
  final String gender;
  final DateTime birthday;
  final String? avatar;
  final String documentType;
  final double documentNumber;
  final String? documentPictureFront;
  final String? documentPictureBack;
  final bool renaperValid;

  const UserProfile({
      required this.userid,
      this.title,
      required this.firstName,
      required this.lastName,
      required this.role,
      required this.gender,
      required this.birthday,
      this.avatar,
      required this.documentType,
      required this.documentNumber,
      this.documentPictureFront,
      this.documentPictureBack,
      required this.renaperValid,
  });

  dynamic toJson() => {
    'userid':userid,
    'title':title,
    'firstName':firstName,
    'lastName':lastName,
    'role':role,
    'gender':gender,
    'birthday':birthday,
    'avatar':avatar,
    'documentType':documentType,
    'documentNumber':documentNumber,
    'documentPictureFront':documentPictureFront,
    'documentPictureBack':documentPictureBack,
    'renaperValid':renaperValid,
  };

  @override
  String toString() {
    return toJson().toString();
  }

  @override
  List<Object> get props {
    return [userid,firstName,lastName,role,gender,birthday,documentType,documentNumber,renaperValid];
    
  }
}
