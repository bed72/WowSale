import 'package:flutter/material.dart';

import 'package:ohhferta/src/presentation/routes/routes.dart';

class ApplicationScreen extends StatelessWidget {
  const ApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
