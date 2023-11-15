import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@injectable
class SecurityStorage {
  final FlutterSecureStorage _storage;

  SecurityStorage(this._storage);

}