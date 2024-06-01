import 'package:either_dart/either.dart';

import 'package:ohhferta/src/data/clients/http_client.dart';
import 'package:ohhferta/src/data/typedefs/data_typedef.dart';
import 'package:ohhferta/src/data/datasources/authentication_datasource.dart';

import 'package:ohhferta/src/external/clients/responses/message_response.dart';
import 'package:ohhferta/src/external/clients/responses/sign_in_response.dart';
import 'package:ohhferta/src/external/clients/configurations/path_configuration.dart';
import 'package:ohhferta/src/external/clients/configurations/methods_configuration.dart';

final class RemoteAuthenticationDatasource implements AuthenticationDatasource {
  final HttpClient _client;

  RemoteAuthenticationDatasource({
    required HttpClient client,
  }) : _client = client;

  @override
  Future<DataAuthenticationType> signIn(String email, String password) async =>
      await _client(
        path: PathConfiguration.signIn,
        method: MethodConfiguration.post,
      ).mapLeft(MessageResponse.fromJson).mapRight(SignInResponse.fromJson);
}
