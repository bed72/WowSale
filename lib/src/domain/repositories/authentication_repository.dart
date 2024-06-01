import 'package:ohhferta/src/domain/typedefs/domain_typedef.dart';

abstract interface class AuthenticationRepository {
  Future<DomainAuthenticationType> signIn({
    required String email,
    required String password,
  });
}
