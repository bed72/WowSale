import 'package:flutter_test/flutter_test.dart';
import 'package:ohhferta/src/domain/entities/sign_in_entity.dart';

import 'package:ohhferta/src/domain/entities/user_entity.dart';

void main() {
  test('Should create User Entity with correct values', () {
    final entity = SignInEntity(
      token: '6gJ1p72...',
      user: UserEntity(
        id: '5tg1v4...',
        username: 'Bed',
        name: 'Gabriel Ramos',
        email: 'email@email.com',
        image: 'bed_fVZYv3f.webp',
      ),
    );

    expect(entity.token, '6gJ1p72...');

    expect(entity.user, isA<UserEntity>());
    expect(entity.user.id, '5tg1v4...');
    expect(entity.user.username, 'Bed');
    expect(entity.user.name, 'Gabriel Ramos');
    expect(entity.user.image, 'bed_fVZYv3f.webp');
  });
}
