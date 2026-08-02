/*
  GITHUB ACTIONS AUTOMATED TEST PIPELINE (.github/workflows/flutter_ci.yml)

  name: Flutter Integration CI
  on: [push, pull_request]

  jobs:
    test:
      runs-on: ubuntu-latest
      steps:
        - uses: actions/checkout@v3
        - uses: subosito/flutter-action@v2
          with:
            channel: 'stable'
        - run: flutter pub get
        - run: flutter analyze
        - run: flutter test
*/

void main() {}