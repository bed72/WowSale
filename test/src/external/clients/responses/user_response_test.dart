import 'package:flutter_test/flutter_test.dart';

import 'package:ohhferta/src/external/clients/responses/user_response.dart';

void main() {
  late final Map<String, dynamic> json;

  setUpAll(() {
    json = <String, dynamic>{
      'id': '5tg1v4...',
      'username': 'Bed',
      'name': 'Gabriel Ramos',
      'collectionName': 'users',
      'avatar': 'bed_fVZYv3f.webp',
      'email': 'developer.bed@gmail.com',
    };
  });

  test('Should convert the json correctly', () {
    final response = UserResponse.fromJson(json);

    expect(response.id, '5tg1v4...');
    expect(response.username, 'Bed');
    expect(response.name, 'Gabriel Ramos');
    expect(response.collectionName, 'users');
    expect(response.avatar, 'bed_fVZYv3f.webp');
  });

  test('Should mount the entity correctly', () {
    final response = UserResponse.fromJson(json).toEntity;

    expect(response.id, '5tg1v4...');
    expect(response.username, 'Bed');
    expect(response.name, 'Gabriel Ramos');
    expect(response.image, '/api/files/users/5tg1v4.../bed_fVZYv3f.webp');
  });
}
