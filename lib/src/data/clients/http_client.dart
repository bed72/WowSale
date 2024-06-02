import 'package:ohhferta/src/external/typedefs/external_typedef.dart';

import 'package:ohhferta/src/external/clients/configurations/path_configuration.dart';
import 'package:ohhferta/src/external/clients/configurations/methods_configuration.dart';

abstract interface class HttpClient {
  Future<ExternalType> call({
    required PathConfiguration path,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    MethodConfiguration method = MethodConfiguration.get,
  });
}
