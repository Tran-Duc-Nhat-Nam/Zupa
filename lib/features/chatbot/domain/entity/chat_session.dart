import 'package:zupa/features/chatbot/domain/entity/chat_message.dart';

class ChatSession {
  const ChatSession({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.messages,
  });

  final String id;
  final String title;
  final DateTime createdAt;
  final List<ChatMessage> messages;
}
