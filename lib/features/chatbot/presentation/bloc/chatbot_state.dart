import 'package:freezed_annotation/freezed_annotation.dart';

part 'chatbot_state.freezed.dart';

@freezed
sealed class ChatMessage with _$ChatMessage {
  const factory ChatMessage({
    required String text,
    required bool isUser,
    @Default(false) bool isStreaming,
  }) = _ChatMessage;
}

@freezed
sealed class ChatbotState with _$ChatbotState {
  const factory ChatbotState.initial() = Initial;
  const factory ChatbotState.loadingModel() = LoadingModel;
  const factory ChatbotState.downloading(double progress) = Downloading;
  const factory ChatbotState.ready({
    @Default([]) List<ChatMessage> messages,
    @Default(false) bool isProcessing,
    String? currentStreamingResponse,
  }) = Ready;
  const factory ChatbotState.error(String message) = Error;
}
