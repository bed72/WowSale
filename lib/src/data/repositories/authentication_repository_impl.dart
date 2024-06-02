import 'package:either_dart/either.dart';

import 'package:ohhferta/src/data/datasources/authentication_datasource.dart';

import 'package:ohhferta/src/domain/typedefs/domain_typedef.dart';
import 'package:ohhferta/src/domain/repositories/authentication_repository.dart';

final class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationDatasource _datasource;

  AuthenticationRepositoryImpl({
    required AuthenticationDatasource datasource,
  }) : _datasource = datasource;

  @override
  Future<DomainAuthenticationType> signIn({
    required String email,
    required String password,
  }) async =>
      _datasource
          .signIn(email, password)
          .mapRight((success) => success.toEntity)
          .mapLeft((message) => message.toEntity);
}
