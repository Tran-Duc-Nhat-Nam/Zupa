import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/helper/debugger/debugger_helper.dart';
import 'package:zupa/core/services/chatbot_service.dart';
import 'package:zupa/features/chatbot/presentation/bloc/chatbot_state.dart';

@injectable
class ChatbotCubit extends Cubit<ChatbotState> {
  final ChatbotService _chatbotService;
  StreamSubscription? _streamSubscription;

  ChatbotCubit(this._chatbotService) : super(const .initial());

  Future<void> loadModel() async {
    try {
      final isInstalled = await _chatbotService.isModelInstalled();
      if (!isInstalled) {
        _chatbotService.installModelWithProgress().listen(
          (progress) {
            emit(.downloading(progress));
          },
          onDone: () async {
            await _initModel();
          },
          onError: (e) {
            DebuggerHelper.talker.error(e.toString());
            emit(.error(e.toString()));
          },
        );
      } else {
        await _initModel();
      }
    } catch (e) {
      DebuggerHelper.talker.error(e.toString());
      emit(.error(e.toString()));
    }
  }

  Future<void> _initModel() async {
    emit(const .loadingModel());
    try {
      final error = await _chatbotService.initModel();
      if (error != null) {
        emit(.error(error));
      } else {
        emit(const .ready());
      }
    } catch (e) {
      DebuggerHelper.talker.error(e.toString());
      emit(.error(e.toString()));
    }
  }

  Future<void> sendMessage(String text) async {
    final currentState = state;
    if (currentState is! Ready) return;

    final userMessage = ChatMessage(text: text, isUser: true);
    final updatedMessages = List<ChatMessage>.from(currentState.messages)
      ..add(userMessage);

    emit(
      currentState.copyWith(
        messages: updatedMessages,
        isProcessing: true,
        currentStreamingResponse: '',
      ),
    );

    try {
      String fullResponse = '';
      _streamSubscription?.cancel();
      _streamSubscription = _chatbotService
          .sendMessageStream(text)
          .listen(
            (token) {
              if (token != null) {
                fullResponse += token;
                emit(
                  (state as Ready).copyWith(
                    currentStreamingResponse: fullResponse,
                  ),
                );
              }
            },
            onDone: () {
              final aiMessage = ChatMessage(text: fullResponse, isUser: false);
              final finalMessages = List<ChatMessage>.from(
                (state as Ready).messages,
              )..add(aiMessage);
              emit(
                (state as Ready).copyWith(
                  messages: finalMessages,
                  isProcessing: false,
                  currentStreamingResponse: null,
                ),
              );
            },
            onError: (e) {
              DebuggerHelper.talker.error(e.toString());
              emit(.error(e.toString()));
            },
          );
    } catch (e) {
      DebuggerHelper.talker.error(e.toString());
      emit(.error(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
