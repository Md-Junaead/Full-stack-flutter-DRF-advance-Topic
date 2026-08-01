import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class HttpClient {
  Future<Map<String, dynamic>> get(String url) async => {};
}

// Mock Class
class MockHttpClient extends Mock implements HttpClient {}

void main() {
  late MockHttpClient mockClient;

  setUp(() {
    mockClient = MockHttpClient();
  });

  test('Fetch data successfully using mock client', () async {
    // Stubbing network API call
    when(() => mockClient.get('https://api.example.com/user'))
        .thenAnswer((_) async => {'id': 1, 'name': 'Mock User'});

    final response = await mockClient.get('https://api.example.com/user');

    expect(response['name'], equals('Mock User'));
    verify(() => mockClient.get('https://api.example.com/user')).called(1);
  });
}