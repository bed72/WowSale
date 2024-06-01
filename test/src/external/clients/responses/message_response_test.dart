import 'package:flutter_test/flutter_test.dart';

import 'package:ohhferta/src/domain/entities/message_entity.dart';

import 'package:ohhferta/src/external/clients/responses/message_response.dart';

void main() {
  late final Map<String, dynamic> json;

  setUpAll(() {
    json = <String, dynamic>{
      'code': 400,
      'message': 'Something went wrong while processing your request.'
    };
  });

  test('Should convert the json correctly', () {
    final response = MessageResponse.fromJson(json);

    expect(response.code, 400);
    expect(
      response.message,
      'Something went wrong while processing your request.',
    );
  });

  test('Should mount the entity correctly', () {
    final response = MessageResponse.fromJson(json).toEntity;

    expect(response, isA<MessageEntity>());
    expect(response.message, 'Ops, um erro inesperado aconteceu.');
  });

  test('Should mount the entity correctly with default "message"', () {
    final jsonChanged = json.map((key, value) {
      if (key == 'code') value = 500;

      return MapEntry(key, value);
    });

    final response = MessageResponse.fromJson(jsonChanged).toEntity;

    expect(response, isA<MessageEntity>());
    expect(response.message, 'Ops, um erro interno aconteceu.');
  });
}
