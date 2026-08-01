import 'package:flutter_test/flutter_test.dart';

// 1. STUB: Fixed Hardcoded Response
class StubUserRepo {
  String getUser() => 'Fixed Stub Value';
}

// 2. FAKE: Simplified Working Implementation (In-memory storage)
class FakeUserRepo {
  final List<String> _users = [];
  
  void addUser(String name) => _users.add(name);
  List<String> getUsers() => List.unmodifiable(_users);
}

void main() {
  test('Fake Repository Test', () {
    final fakeRepo = FakeUserRepo();
    fakeRepo.addUser('Alice');
    
    expect(fakeRepo.getUsers().length, 1);
    expect(fakeRepo.getUsers().first, 'Alice');
  });
}