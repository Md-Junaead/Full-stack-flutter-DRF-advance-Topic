// File: 19_pigeon_typesafe_channel.dart
// Note: This is an input file used by Pigeon generator CLI tool to auto-generate Swift & Kotlin code.
import 'package:pigeon/pigeon.dart';

class SearchRequest {
  String? query;
}

class SearchReply {
  String? result;
}

@HostApi()
abstract class NativeSearchApi {
  SearchReply search(SearchRequest request);
}
/*
  Command to Generate Code:
  flutter pub run pigeon --input 19_pigeon_typesafe_channel.dart
*/