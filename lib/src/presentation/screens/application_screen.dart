import 'package:flutter/material.dart';
import 'package:ioc_container/ioc_container.dart';

import 'package:ohhferta/src/presentation/routes/routes.dart';

class ApplicationScreen extends StatelessWidget {
  final IocContainer container;

  const ApplicationScreen({super.key, required this.container});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: routerConfig(container: container),
    );
  }
}
