import 'package:dio/dio.dart';

import 'package:mocktail/mocktail.dart';

class InstanceConfigurationMock extends Mock implements Dio {
  Future<Response<dynamic>> call() => request(
        any(),
        data: any(named: 'data'),
        options: any(named: 'options'),
        queryParameters: any(named: 'queryParameters'),
      );

  Response response({
    required int statusCode,
    required Map<String, dynamic> data,
  }) =>
      Response(
        data: data,
        statusCode: statusCode,
        requestOptions: RequestOptions(),
      );
}
