import 'package:pocketbase/pocketbase.dart';

abstract interface class PocketBaseClient {
  PocketBase get call;
}

class PocketBaseClientImpl implements PocketBaseClient {
  final PocketBase _pocketBase;

  PocketBaseClientImpl({required PocketBase pocketBase})
      : _pocketBase = pocketBase;

  @override
  PocketBase get call => _pocketBase;
}
