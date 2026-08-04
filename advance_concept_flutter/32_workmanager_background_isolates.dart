// 32_workmanager_background_isolates.dart
import 'package:workmanager/workmanager.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    // Perform background operation (e.g. sync local storage with API)
    return Future.value(true);
  });
}

void initBackgroundTasks() {
  Workmanager().initialize(callbackDispatcher, isInDebugMode: false);
  Workmanager().registerPeriodicTask(
    "1",
    "syncDataPeriodicTask",
    frequency: const Duration(minutes: 15),
  );
}