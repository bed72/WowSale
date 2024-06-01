import 'package:ohhferta/src/data/typedefs/data_typedef.dart';

abstract interface class AuthenticationDatasource {
  Future<DataAuthenticationType> signIn(String email, String password);
}
