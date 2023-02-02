//import 'package:skere_app/domain/model/user.dart';
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? userid;
  final String emailAddress;
  final String passwordHash;
  final bool userValid;

  const UserEntity({
    this.userid,
    required this.emailAddress,
    required this.passwordHash,
    this.userValid = true,
  });

  @override
  List<Object> get props {
    return [emailAddress, passwordHash, userValid];
  }
}
