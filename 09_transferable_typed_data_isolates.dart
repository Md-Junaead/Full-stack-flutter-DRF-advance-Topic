// File Name: 09_transferable_typed_data_isolates.dart
import 'dart:isolate';
import 'dart:typed_data';

/// Real-world system: High-Speed Camera Video Frame Processing
class VideoFrameStreamer {
  
  void sendFrameToWorkerIsolate(Uint8List rawFrameBytes, SendPort workerSendPort) {
    // Standard sending copies the whole byte array across thread memory boundaries (Slow for 4K frames).
    // TransferableTypedData uses underlying byte pointer for Zero-Copy Transfer.
    
    final TransferableTypedData transferableData = TransferableTypedData.fromList([rawFrameBytes]);
    
    // Fast pointer transfer
    workerSendPort.send(transferableData);
  }

  // Worker Isolate side receiver
  static void isolateWorkerEntryPoint(SendPort mainIsolateSendPort) {
    final receivePort = ReceivePort();
    mainIsolateSendPort.send(receivePort.sendPort);

    receivePort.listen((message) {
      if (message is TransferableTypedData) {
        // Access raw byte data directly without allocation overhead
        final Uint8List bytes = message.materialize().asUint8List();
        print("Worker Isolate processing frame size: ${bytes.lengthInBytes} bytes");
      }
    });
  }
}