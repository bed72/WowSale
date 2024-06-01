import 'package:ohhferta/src/domain/entities/user_entity.dart';

class SignInEntity {
  final String _token;
  final UserEntity _user;

  SignInEntity._internal(
    this._token,
    this._user,
  );

  factory SignInEntity({
    required String token,
    required UserEntity user,
  }) =>
      SignInEntity._internal(token, user);

  String get token => _token;

  UserEntity get user => _user;
}
