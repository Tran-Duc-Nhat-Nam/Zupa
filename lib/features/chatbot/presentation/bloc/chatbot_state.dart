part of 'chatbot_cubit.dart';

@freezed
sealed class ChatbotState with _$ChatbotState {
  const factory ChatbotState.initial() = Initial;

  const factory ChatbotState.loadingModel() = LoadingModel;

  const factory ChatbotState.downloading(double progress) = Downloading;

  const factory ChatbotState.ready({
    @Default([]) List<ChatMessage> messages,
    @Default([]) List<ChatSession> sessions,
    String? currentSessionId,
    @Default(false) bool isProcessing,
    String? currentStreamingResponse,
  }) = Ready;

  const factory ChatbotState.error(String message) = Error;
}
