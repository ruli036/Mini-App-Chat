class ChatMessage {
  final String senderId;
  final String receiveId;
  final String senderName;
  final String text;
  bool isRead;
  final DateTime timestamp;

  ChatMessage({
    required this.senderId,
    required this.receiveId,
    required this.senderName,
    required this.text,
    required this.isRead,
    required this.timestamp,
  });
}
