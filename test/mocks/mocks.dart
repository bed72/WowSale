import 'dart:convert';

import 'package:flutter/services.dart';

Future<Map<String, dynamic>> loadMock(String path) async {
  final String json = await rootBundle.loadString(path);

  return jsonDecode(json);
}

enum PathMock {
  signIn('test/mocks/clients/responses/sign_in_mock.json');

  final String path;

  const PathMock(this.path);
}
