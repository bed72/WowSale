import 'dart:developer';

import 'package:either_dart/either.dart';
import 'package:pocketbase/pocketbase.dart';

import 'package:ohhferta/src/data/typedefs/data_typedef.dart';
import 'package:ohhferta/src/data/datasources/authentication_datasource.dart';

import 'package:ohhferta/src/external/clients/pocket_base_client.dart';
import 'package:ohhferta/src/external/clients/responses/message_response.dart';
import 'package:ohhferta/src/external/clients/responses/sign_in_response.dart';

final class RemoteAuthenticationDatasource implements AuthenticationDatasource {
  final PocketBaseClient _client;

  RemoteAuthenticationDatasource({
    required PocketBaseClient client,
  }) : _client = client;

  @override
  Future<DataAuthenticationType> signIn(String email, String password) async {
    try {
      final response = await _client.call
          .collection('users')
          .authWithPassword(email, password);

      return Right(SignInResponse.fromJson(response.toJson()));
    } on ClientException catch (exception) {
      return Left(MessageResponse.fromJson(exception.response));
    } catch (exception) {
      log(exception.toString(), name: 'RemoteAuthenticationDatasource');
      return Left(MessageResponse.standard());
    }
  }
}
