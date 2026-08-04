// 27_isar_nosql_secure_storage.dart
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureSessionManager {
  final _storage = const FlutterSecureStorage();

  Future<void> saveAuthToken(String token) async {
    await _storage.write(
      key: 'jwt_token',
      value: token,
      aOptions: const AndroidOptions(encryptedSharedPreferences: true),
    );
  }

  Future<String?> getAuthToken() async {
    return await _storage.read(key: 'jwt_token');
  }
}