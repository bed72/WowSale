import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:ohhferta/src/data/clients/http_client.dart';
import 'package:ohhferta/src/external/locators/locator.dart';

import 'package:ohhferta/src/external/clients/http_client_impl.dart';

final class HttpLocator implements Locator {
  @override
  void call(GetIt locator) {
    locator
      ..registerFactory<Dio>(() => Dio())
      ..registerSingleton<HttpClient>(
        HttpClientImpl(instance: locator.get<Dio>()),
        signalsReady: true,
        instanceName: 'HttpClient',
      );
  }
}
