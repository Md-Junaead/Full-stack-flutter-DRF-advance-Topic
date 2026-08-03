// File: 17_platform_channels_native.dart
import 'package:flutter/services.dart';

class NativeBatteryService {
  static const MethodChannel _methodChannel = MethodChannel('com.example.app/battery');
  static const EventChannel _eventChannel = EventChannel('com.example.app/charging_stream');

  // MethodChannel Call
  Future<int> getBatteryLevel() async {
    try {
      final int result = await _methodChannel.invokeMethod('getBatteryLevel');
      return result;
    } on PlatformException catch (e) {
      return -1;
    }
  }

  // EventChannel Listening (Stream)
  Stream<dynamic> get chargingStatusStream {
    return _eventChannel.receiveBroadcastStream();
  }
}