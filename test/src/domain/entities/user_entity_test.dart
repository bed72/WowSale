import 'package:flutter_test/flutter_test.dart';

import 'package:ohhferta/src/domain/entities/user_entity.dart';

void main() {
  test('Should create User Entity with correct values', () {
    final entity = UserEntity(
      id: '5tg1v4...',
      username: 'Bed',
      name: 'Gabriel Ramos',
      email: 'email@email.com',
      image: '/api/files/users/5tg1v4.../bed_fVZYv3f.webp',
    );

    expect(entity.id, '5tg1v4...');
    expect(entity.username, 'Bed');
    expect(entity.name, 'Gabriel Ramos');
    expect(entity.image, '/api/files/users/5tg1v4.../bed_fVZYv3f.webp');
  });
}
