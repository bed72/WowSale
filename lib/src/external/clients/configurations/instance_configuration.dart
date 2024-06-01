import 'package:dio/dio.dart';

import 'package:ohhferta/src/external/clients/configurations/path_configuration.dart';

class InstanceConfiguration {
  Dio get dio => Dio(_options);

  BaseOptions get _options => BaseOptions(
        baseUrl: PathConfiguration.base.value,
        headers: {
          'Content-Type': 'application/json',
        },
      );
}
