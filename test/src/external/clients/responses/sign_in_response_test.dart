import 'package:flutter_test/flutter_test.dart';

import 'package:ohhferta/src/external/clients/responses/user_response.dart';
import 'package:ohhferta/src/external/clients/responses/sign_in_response.dart';

void main() {
  late final Map<String, dynamic> json;

  setUpAll(() {
    json = <String, dynamic>{
      'token': '6gJ1p72...',
      'record': {
        'id': '5tg1v4...',
        'username': 'Bed',
        'name': 'Gabriel Ramos',
        'collectionName': 'users',
        'avatar': 'bed_fVZYv3f.webp',
        'email': 'developer.bed@gmail.com',
      },
    };
  });

  test('Should convert the json correctly', () {
    final response = SignInResponse.fromJson(json);

    expect(response.token, '6gJ1p72...');

    expect(response.user, isA<UserResponse>());
    expect(response.user.id, '5tg1v4...');
    expect(response.user.username, 'Bed');
    expect(response.user.name, 'Gabriel Ramos');
    expect(response.user.collectionName, 'users');
    expect(response.user.avatar, 'bed_fVZYv3f.webp');
  });

  test('Should mount the entity correctly', () {
    final response = SignInResponse.fromJson(json).toEntity;

    expect(response.token, '6gJ1p72...');
    expect(response.user.id, '5tg1v4...');
    expect(response.user.username, 'Bed');
    expect(response.user.name, 'Gabriel Ramos');
    expect(response.user.image, '/api/files/users/5tg1v4.../bed_fVZYv3f.webp');
  });
}
