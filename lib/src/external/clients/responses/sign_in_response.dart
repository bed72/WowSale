import 'package:ohhferta/src/domain/entities/sign_in_entity.dart';

import 'package:ohhferta/src/external/clients/responses/user_response.dart';

class SignInResponse {
  String token;
  UserResponse user;

  SignInResponse(this.token, this.user);

  SignInResponse.fromJson(Map<String, dynamic> json)
      : token = json['token'] as String,
        user = UserResponse.fromJson(json['record'] as Map<String, dynamic>);

  SignInEntity get toEntity => SignInEntity(
        token: token,
        user: user.toEntity,
      );
}
