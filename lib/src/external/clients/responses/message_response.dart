import 'package:ohhferta/src/domain/entities/message_entity.dart';

class MessageResponse {
  int code;
  String message;

  MessageResponse(this.code, this.message);

  MessageResponse.standard()
      : code = 500,
        message = 'Ops, um erro interno aconteceu.';

  MessageResponse.fromJson(Map<String, dynamic> json)
      : code = json['code'] as int,
        message = json['message'] as String;

  MessageEntity get toEntity => MessageEntity(message: _message);

  String get _message => switch (code) {
        400 => 'Ops, um erro inesperado aconteceu.',
        422 => 'Ops, algo deu errado com os dados enviados.',
        401 => 'Ops, vocẽ não tem permissão para acessar esse recurso.',
        _ => 'Ops, um erro interno aconteceu.'
      };
}
