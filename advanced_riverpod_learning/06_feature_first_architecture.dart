/*
  FEATURE-FIRST ARCHITECTURE MATRIX:
  
  lib/
  │── src/
  │   ├── features/
  │   │   ├── auth/
  │   │   │   ├── data/ (repositories, datasources, models)
  │   │   │   ├── application/ (services, notifiers)
  │   │   │   └── presentation/ (screens, widgets, controllers)
  │   │   ├── cart/
  │   │   └── profile/
  │   └── shared/ (common widgets, utilities)
*/

import 'package:flutter_riverpod/flutter_riverpod.dart';

// Feature-scoped Provider Definition
class AuthRepository {
  Future<bool> login() async => true;
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});