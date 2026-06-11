class ChatMessage {
  const ChatMessage({
    required this.text,
    required this.isUser,
    this.isStreaming = false,
  });

  final String text;
  final bool isUser;
  final bool isStreaming;
}
