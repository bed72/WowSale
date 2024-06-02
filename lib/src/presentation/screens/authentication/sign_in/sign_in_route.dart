import 'package:flutter/material.dart';

import 'package:ohhferta/src/presentation/screens/authentication/sign_in/sign_in_screen.dart';

class SignInRoute {
  static const String path = '/';

  static MaterialPageRoute route({Object? arguments}) =>
      MaterialPageRoute(builder: (_) => const SignInScreen());
}
