import 'package:get_it/get_it.dart';

import 'package:ohhferta/src/domain/repositories/authentication_repository.dart';

import 'package:ohhferta/src/data/clients/http_client.dart';
import 'package:ohhferta/src/data/datasources/authentication_datasource.dart';
import 'package:ohhferta/src/data/repositories/authentication_repository_impl.dart';

import 'package:ohhferta/src/external/locators/locator.dart';
import 'package:ohhferta/src/external/datasource/remote_authentication_datasource.dart';

import 'package:ohhferta/src/presentation/screens/authentication/sign_in/sign_in_state.dart';

final class AuthenticationLocator implements Locator {
  @override
  void call(GetIt locator) {
    locator
      ..registerFactory<AuthenticationDatasource>(
        () => RemoteAuthenticationDatasource(client: locator.get<HttpClient>()),
      )
      ..registerFactory<AuthenticationRepository>(
        () => AuthenticationRepositoryImpl(
            datasource: locator.get<RemoteAuthenticationDatasource>()),
      )
      ..registerLazySingleton<SignInState>(
        () => SignInState(repository: locator.get<AuthenticationRepository>()),
        instanceName: 'SignInState',
        dispose: (state) => state.dispose(),
      );
  }
}
