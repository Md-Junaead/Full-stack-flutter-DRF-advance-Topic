import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

abstract class AnalyticsService {
  void logEvent(String name);
}

class FirebaseAnalyticsImpl implements AnalyticsService {
  @override
  void logEvent(String name) => print('Event: $name');
}

void setupServiceLocator() {
  // Service Locator Pattern Boundary
  locator.registerLazySingleton<AnalyticsService>(() => FirebaseAnalyticsImpl());
}