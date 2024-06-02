import 'package:flutter/material.dart';

import 'package:ohhferta/src/presentation/screens/authentication/sign_in/sign_in_route.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    return switch (settings.name) {
      SignInRoute.path => SignInRoute.route(),
      _ => MaterialPageRoute(builder: (context) => _errorRoute()),
    };
  }

  static Widget _errorRoute() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: const Center(
        child: Text('ERROR'),
      ),
    );
  }
}
