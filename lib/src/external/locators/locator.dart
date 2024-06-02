import 'package:get_it/get_it.dart';

import 'package:ohhferta/src/external/locators/http_locator.dart';
import 'package:ohhferta/src/external/locators/authentication_locator.dart';

abstract interface class Locator {
  void call(GetIt locator);
}

final class MainLocator implements Locator {
  @override
  void call(GetIt locator) {
    HttpLocator()(locator);
    AuthenticationLocator()(locator);
  }
}
