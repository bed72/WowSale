import 'package:either_dart/either.dart';

import 'package:ohhferta/src/external/clients/responses/message_response.dart';
import 'package:ohhferta/src/external/clients/responses/sign_in_response.dart';

typedef DataAuthenticationType = Either<MessageResponse, SignInResponse>;
