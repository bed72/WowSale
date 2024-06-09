import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ioc_container/ioc_container.dart';

import 'package:ohhferta/src/presentation/screens/authentication/sign_in/sign_in_screen.dart';

GoRouter routerConfig({required IocContainer container}) => GoRouter(
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) =>
              const SignInScreen(),
        ),
      ],
    );
