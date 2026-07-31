import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. Data Source Abstraction
abstract class RemoteUserDataSource {
  Future<Map<String, dynamic>> getUserRawData();
}

class DioUserDataSource implements RemoteUserDataSource {
  @override
  Future<Map<String, dynamic>> getUserRawData() async {
    return {'id': '101', 'name': 'Architect'};
  }
}

// 2. Repository Abstraction
abstract class UserRepository {
  Future<String> getUserName();
}

class UserRepositoryImpl implements UserRepository {
  final RemoteUserDataSource dataSource;
  UserRepositoryImpl(this.dataSource);

  @override
  Future<String> getUserName() async {
    final raw = await dataSource.getUserRawData();
    return raw['name'] as String;
  }
}

// 3. Providers
final dataSourceProvider = Provider<RemoteUserDataSource>((ref) => DioUserDataSource());
final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepositoryImpl(ref.watch(dataSourceProvider));
});