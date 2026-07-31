// File Name: 08_isolate_spawn_and_run.dart
import 'dart:convert';
import 'dart:isolate';

/// Real-world system: Encryption & Large JSON Transformer Service
class HeavyDataIsolateProcessor {
  
  // Top-level / static function required for Isolate execution
  static String _parseAndEncryptPayload(String jsonRaw) {
    final List decoded = jsonDecode(jsonRaw);
    
    // Simulate heavy CPU computation
    final processed = decoded.map((e) => "Encrypted_${e.toString()}").toList();
    return jsonEncode(processed);
  }

  /// Production approach using Isolate.run (Dart 2.19+)
  Future<String> processDataInBackground(String rawJson) async {
    // Isolate.run spawns, executes, and returns result while freeing Isolate memory automatically
    final String result = await Isolate.run(() => _parseAndEncryptPayload(rawJson));
    return result;
  }
}