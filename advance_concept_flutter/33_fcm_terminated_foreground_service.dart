// 33_fcm_terminated_foreground_service.dart
import 'package:firebase_messaging/firebase_messaging.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Handle notification received when app is terminated or in background
  // Update local SQLite / Hive database here directly
}

void setupFCM() {
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
}