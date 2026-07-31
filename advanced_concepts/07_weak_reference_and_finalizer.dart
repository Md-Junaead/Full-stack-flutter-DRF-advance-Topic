// File Name: 07_weak_reference_and_finalizer.dart
import 'dart:ffi';

/// Real-world system: Native Memory Wrapper for OpenCV Image Processing
class NativeImageBuffer {
  final String bufferId;
  Pointer<Void>? _nativePointer;

  // Finalizer triggers automatically when Dart object is Garbage Collected
  static final Finalizer<Pointer<Void>> _nativeFinalizer = Finalizer((ptr) {
    print("GC Cleanup: Freeing Native C++ Memory at $ptr");
    // call Native C++ free(ptr) via FFI here
  });

  NativeImageBuffer(this.bufferId, Pointer<Void> nativePtr) : _nativePointer = nativePtr {
    // Attach Dart instance to Finalizer with native resource handle
    _nativeFinalizer.attach(this, nativePtr, detach: this);
  }

  void releaseManually() {
    if (_nativePointer != null) {
      _nativeFinalizer.detach(this);
      // Manual free native pointer
      _nativePointer = null;
    }
  }
}

class CacheManager {
  // WeakReference allows GC to collect the cache object under low memory pressure
  WeakReference<NativeImageBuffer>? _cachedBuffer;

  void setCache(NativeImageBuffer buffer) {
    _cachedBuffer = WeakReference(buffer);
  }

  NativeImageBuffer? getCache() {
    // Returns object if alive, or null if GC collected it
    return _cachedBuffer?.target;
  }
}