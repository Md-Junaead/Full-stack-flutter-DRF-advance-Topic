/*
  PRODUCTION BUILD COMMAND WITH SIZE REDUCTION STRATEGIES:
  
  $ flutter build apk --release \
      --target-platform android-arm64 \
      --split-per-abi \
      --obfuscate \
      --split-debug-info=./build_debug_symbols
      
  Explanation:
  - --split-per-abi: Generates individual smaller APKs per processor architecture instead of a fat APK.
  - --split-debug-info: Strips out heavy symbols and stacktraces to external directory.
*/

void main() {}