import 'dart:async';

// Global Event Bus Architecture Pattern
class AppEventBus {
  static final AppEventBus _instance = AppEventBus._internal();
  factory AppEventBus() => _instance;
  AppEventBus._internal();

  final _eventController = StreamController<String>.broadcast();

  Stream<String> get eventStream => _eventController.stream;

  void emit(String eventName) {
    _eventController.add(eventName);
  }
}

void main() {
  final bus = AppEventBus();

  // Scoped Listener
  final subscription = bus.eventStream.listen((event) {
    if (event == 'SESSION_EXPIRED') {
      // Trigger Logout Navigation
    }
  });

  bus.emit('SESSION_EXPIRED');
  subscription.cancel(); // Prevent Memory Leak
}