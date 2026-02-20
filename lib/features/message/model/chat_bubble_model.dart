enum MessageType { text, image }

class ChatBubble {
  final String id;
  final String text;
  final DateTime time;
  final bool isSentByMe;
  final MessageType type;

  ChatBubble({
    required this.id,
    required this.text,
    required this.time,
    required this.isSentByMe,
    this.type = MessageType.text,
  });
}