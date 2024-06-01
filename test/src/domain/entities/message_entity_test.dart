import 'package:flutter_test/flutter_test.dart';

import 'package:ohhferta/src/domain/entities/message_entity.dart';

void main() {
  test('Should create Message Entity with correct values', () {
    final entity = MessageEntity(message: 'Ops, um erro aconteceu!');

    expect(entity.message, 'Ops, um erro aconteceu!');
  });
}
