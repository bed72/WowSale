class MessageEntity {
  final String _message;

  MessageEntity._internal(this._message);

  factory MessageEntity({
    required String message,
  }) =>
      MessageEntity._internal(message);

  String get message => _message;
}
