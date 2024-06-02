import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ohhferta/src/domain/entities/user_entity.dart';
import 'package:ohhferta/src/domain/entities/message_entity.dart';
import 'package:ohhferta/src/domain/entities/sign_in_entity.dart';
import 'package:ohhferta/src/domain/repositories/authentication_repository.dart';

import 'package:ohhferta/src/data/clients/http_client.dart';
import 'package:ohhferta/src/data/datasources/authentication_datasource.dart';
import 'package:ohhferta/src/data/repositories/authentication_repository_impl.dart';

import 'package:ohhferta/src/external/clients/http_client_impl.dart';
import 'package:ohhferta/src/external/datasource/remote_authentication_datasource.dart';

import 'mocks/authentication_mock.dart';
import 'responses/authentication_response.dart';

void main() {
  late final InstanceConfigurationMock mock;

  late final HttpClient client;
  late final AuthenticationDatasource datasource;
  late final AuthenticationRepository repository;

  setUpAll(() {
    mock = InstanceConfigurationMock();
    client = HttpClientImpl(instance: mock);
    datasource = RemoteAuthenticationDatasource(client: client);
    repository = AuthenticationRepositoryImpl(datasource: datasource);
  });

  test('Should try authenticate with failure (sign in)', () async {
    when(() => mock()).thenThrow(
      (_) async => mock.response(statusCode: 400, data: signInFailureMock),
    );

    final response = await repository.signIn(
      password: 'P@ssW0rd',
      email: 'email@emailcom',
    );

    expect(response.isLeft, true);
    expect(response.left, isA<MessageEntity>());
    expect(response.left.message, 'Ops, um erro interno aconteceu.');
  });

  test('Should try authenticate successfully (sign in)', () async {
    when(() => mock()).thenAnswer(
      (_) async => mock.response(statusCode: 200, data: signInSuccessMock),
    );

    final response = await repository.signIn(
      password: 'P@ssW0rd',
      email: 'email@email.com',
    );

    expect(response.isRight, true);
    expect(response.right, isA<SignInEntity>());
    expect(response.right.token, '6gJ1p72...');

    expect(response.right.user, isA<UserEntity>());
    expect(response.right.user.id, '5tg1v4...');
    expect(response.right.user.username, 'Bed');
    expect(response.right.user.name, 'Gabriel Ramos');
    expect(
      response.right.user.image,
      '/api/files/users/5tg1v4.../bed_fVZYv3f.webp',
    );
  });
}
