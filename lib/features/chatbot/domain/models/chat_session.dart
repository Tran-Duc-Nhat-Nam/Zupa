import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zupa/features/chatbot/presentation/bloc/chatbot_state.dart';

part 'chat_session.freezed.dart';

@freezed
sealed class ChatSession with _$ChatSession {
  const factory ChatSession({
    required String id,
    required String title,
    required DateTime createdAt,
    required List<ChatMessage> messages,
  }) = _ChatSession;
}
