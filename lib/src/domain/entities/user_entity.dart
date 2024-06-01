class UserEntity {
  final String _id;
  final String _name;
  final String _email;
  final String _image;
  final String _username;

  UserEntity._internal(
    this._id,
    this._name,
    this._email,
    this._image,
    this._username,
  );

  factory UserEntity({
    required String id,
    required String name,
    required String email,
    required String image,
    required String username,
  }) =>
      UserEntity._internal(
        id,
        name,
        email,
        image,
        username,
      );

  String get id => _id;

  String get name => _name;

  String get email => _email;

  String get image => _image;

  String get username => _username;
}
