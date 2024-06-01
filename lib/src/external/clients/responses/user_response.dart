import 'package:ohhferta/src/domain/entities/user_entity.dart';

class UserResponse {
  String id;
  String name;
  String email;
  String avatar;
  String username;
  String collectionName;

  UserResponse(
    this.id,
    this.name,
    this.email,
    this.avatar,
    this.username,
    this.collectionName,
  );

  UserResponse.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        name = json['name'] as String,
        email = json['email'] as String,
        avatar = json['avatar'] as String,
        username = json['username'] as String,
        collectionName = json['collectionName'] as String;

  UserEntity get toEntity => UserEntity(
        id: id,
        name: name,
        email: email,
        image: _image,
        username: username,
      );

  String get _image => '/api/files/$collectionName/$id/$avatar';
}
