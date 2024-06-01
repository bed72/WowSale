import 'package:flutter_test/flutter_test.dart';

import 'package:ohhferta/src/domain/repositories/authentication_repository.dart';

import 'package:ohhferta/src/data/datasources/authentication_datasource.dart';
import 'package:ohhferta/src/data/repositories/authentication_repository_impl.dart';
import 'package:ohhferta/src/external/clients/pocket_base_client.dart';

import 'package:ohhferta/src/external/datasource/remote_authentication_datasource.dart';

import '../../../mocks/clients/pocket_base_client_mock.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  late final PocketBaseClientMock mock;

  late final PocketBaseClient client;
  late final AuthenticationDatasource datasource;
  late final AuthenticationRepository repository;

  setUpAll(() {
    mock = PocketBaseClientMock();
    client = PocketBaseClientImpl(pocketBase: mock);
    datasource = RemoteAuthenticationDatasource(client: client);
    repository = AuthenticationRepositoryImpl(datasource: datasource);
  });

  test('Should authenticate successfully (sign in)', () async {
    await mock.signInSuccess();

    final response = await repository.signIn(email: '', password: '');

    expect(response.isRight, true);
  });
}
