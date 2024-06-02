import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

import 'package:ohhferta/src/data/clients/http_client.dart';

import 'package:ohhferta/src/external/typedefs/external_typedef.dart';
import 'package:ohhferta/src/external/clients/configurations/path_configuration.dart';
import 'package:ohhferta/src/external/clients/configurations/methods_configuration.dart';

final class HttpClientImpl implements HttpClient {
  final Dio _instance;

  HttpClientImpl({
    required Dio instance,
  }) : _instance = instance {
    _instance.options = _options;
  }

  BaseOptions get _options => BaseOptions(
        baseUrl: PathConfiguration.base.value,
        headers: {
          'Content-Type': 'application/json',
        },
      );

  @override
  Future<ExternalType> call({
    required PathConfiguration path,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    MethodConfiguration method = MethodConfiguration.get,
  }) async {
    try {
      final Response(:data) = await _instance.request(
        path.value,
        data: body,
        queryParameters: queryParameters,
        options: Options(headers: headers, method: method.value),
      );

      return Right(data);
    } on DioException catch (exception) {
      return exception.response == null
          ? Left(_standard)
          : Left(exception.response?.data);
    } catch (exception) {
      log(exception.toString(), name: MethodConfiguration.post.value);
      return Left(_standard);
    }
  }

  Map<String, dynamic> get _standard => <String, dynamic>{
        'code': 500,
        'message': 'Ops, um erro interno aconteceu.',
      };
}
