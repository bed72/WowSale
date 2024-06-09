import 'package:dio/dio.dart';
import 'package:ioc_container/ioc_container.dart';

import 'package:ohhferta/src/domain/repositories/authentication_repository.dart';

import 'package:ohhferta/src/data/clients/http_client.dart';
import 'package:ohhferta/src/data/datasources/authentication_datasource.dart';
import 'package:ohhferta/src/data/repositories/authentication_repository_impl.dart';

import 'package:ohhferta/src/external/clients/http_client_impl.dart';
import 'package:ohhferta/src/external/datasource/remote_authentication_datasource.dart';
import 'package:ohhferta/src/presentation/screens/authentication/sign_in/sign_in_state.dart';

abstract interface class Container {
  IocContainer call();
}

final class MainContainer implements Container {
  @override
  IocContainer call() {
    final IocContainerBuilder builder =
        IocContainerBuilder(allowOverrides: true)
          ..add<Dio>((_) => Dio())
          ..addSingleton<HttpClient>(
            (ioc) => HttpClientImpl(instance: ioc.get<Dio>()),
          )
          ..add<AuthenticationDatasource>(
            (ioc) => RemoteAuthenticationDatasource(
              client: ioc.get<HttpClient>(),
            ),
          )
          ..add<AuthenticationRepository>(
            (ioc) => AuthenticationRepositoryImpl(
              datasource: ioc.get<RemoteAuthenticationDatasource>(),
            ),
          )
          ..add<SignInState>(
            (ioc) =>
                SignInState(repository: ioc.get<AuthenticationRepository>()),
          );

    return builder.toContainer();
  }
}
