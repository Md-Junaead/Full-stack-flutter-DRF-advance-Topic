import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocalCacheStorage {
  String? getCachedUser() => 'Cached User (Offline)';
  void saveCache(String user) {}
}

class NetworkApiClient {
  Future<String> fetchFreshUser() async => 'Fresh User (Online)';
}

final cacheStorageProvider = Provider((ref) => LocalCacheStorage());
final apiClientProvider = Provider((ref) => NetworkApiClient());

final userProfileProvider = FutureProvider<String>((ref) async {
  final cache = ref.read(cacheStorageProvider);
  final api = ref.read(apiClientProvider);

  // Return cached data instantly if present, then attempt network fetch
  final localData = cache.getCachedUser();

  try {
    final freshData = await api.fetchFreshUser();
    cache.saveCache(freshData);
    return freshData;
  } catch (_) {
    return localData ?? 'No Data Available Offline';
  }
});