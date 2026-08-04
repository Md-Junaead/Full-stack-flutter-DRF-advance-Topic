// 30_retrofit_graphql_websockets.dart
import 'package:web_socket_channel/web_socket_channel.dart';

class ResilientWebSocket {
  WebSocketChannel? _channel;
  final Uri _serverUri = Uri.parse('wss://echo.websocket.events');

  void connect() {
    try {
      _channel = WebSocketChannel.connect(_serverUri);
      _channel!.stream.listen(
        (data) {
          // Process stream
        },
        onError: (error) => _reconnect(),
        onDone: () => _reconnect(),
      );
    } catch (_) {
      _reconnect();
    }
  }

  void _reconnect() {
    Future.delayed(const Duration(seconds: 5), () => connect());
  }
}