import 'package:either_dart/either.dart';

import 'package:ohhferta/src/domain/entities/message_entity.dart';
import 'package:ohhferta/src/domain/entities/sign_in_entity.dart';

typedef DomainAuthenticationType = Either<MessageEntity, SignInEntity>;
