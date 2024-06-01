import 'package:mocktail/mocktail.dart';

import 'package:pocketbase/pocketbase.dart';

import '../mocks.dart';

class PocketBaseClientMock extends Mock implements PocketBase {
  Future<void> signInSuccess() async {
    final json = await loadMock(PathMock.signIn.path);

    when(() => collection('user').authWithPassword('', ''))
        .thenAnswer((_) => _success(json));
  }

  Future<RecordAuth> _success(Map<String, dynamic> json) =>
      Future.value(RecordAuth(record: RecordModel(data: json)));
}
