import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';


@immutable
class User extends Equatable {
  final String? userid;
  final String emailAddress;
  final String passwordHash;
  final bool userValid;

  const User({
    this.userid,
    required this.passwordHash,
    required this.emailAddress,
    //analizar esta linea para ver en que momento validar al usuario
    this.userValid = true,
  });

  dynamic toJson() => {
        'userid': userid,
        'emailAddress': emailAddress,
        'passwordHash':passwordHash,
        'isValid': userValid,
      };

  @override
  String toString() {
    return toJson().toString();
  }

  @override
  List<Object> get props {
    return [emailAddress, passwordHash, userValid];
  }
}