import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

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

  setUp(() {
    mock = InstanceConfigurationMock();
    client = HttpClientImpl(instance: mock);
    datasource = RemoteAuthenticationDatasource(client: client);
    repository = AuthenticationRepositoryImpl(datasource: datasource);
  });

  test('Should authenticate successfully (sign in)', () async {
    when(() => mock()).thenAnswer(
      (_) async => mock.response(statusCode: 200, data: signInSuccessMock),
    );

    final response = await repository.signIn(
      password: 'P@ssW0rd',
      email: 'email@email.com',
    );

    expect(response.isRight, true);
  });
}
