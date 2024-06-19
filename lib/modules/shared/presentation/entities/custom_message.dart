import 'message_types.dart';

class CustomMessage {
  CustomMessage({
    required this.messageType,
    required this.message,
  });

  final MessageType messageType;
  final String message;
}
