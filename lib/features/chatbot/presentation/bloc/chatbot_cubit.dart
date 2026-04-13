import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/helper/debugger/debugger_helper.dart';
import 'package:zupa/core/services/chatbot_service.dart';
import 'package:zupa/features/chatbot/data/services/chat_storage_service.dart';
import 'package:zupa/features/chatbot/domain/models/chat_session.dart';
import 'package:zupa/features/chatbot/presentation/bloc/chatbot_state.dart';

@injectable
class ChatbotCubit extends Cubit<ChatbotState> {
  final ChatbotService _chatbotService;
  final ChatStorageService _chatStorageService;
  StreamSubscription? _streamSubscription;

  List<ChatSession> _sessions = [];
  String? _currentSessionId;

  ChatbotCubit(this._chatbotService, this._chatStorageService)
    : super(const .initial());

  Future<void> loadModel() async {
    // 1. Fetch sessions
    _sessions = await _chatStorageService.loadSessions();
    if (_sessions.isNotEmpty) {
      _currentSessionId = _sessions.first.id;
    } else {
      _createNewSessionId();
    }

    // 2. Load model
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

  void _createNewSessionId() {
    _currentSessionId = DateTime.now().millisecondsSinceEpoch.toString();
  }

  Future<void> createNewSession() async {
    _createNewSessionId();
    if (state is Ready) {
      emit(
        (state as Ready).copyWith(
          messages: [],
          currentSessionId: _currentSessionId,
          sessions: _sessions,
        ),
      );
    }
  }

  Future<void> loadSession(String sessionId) async {
    _currentSessionId = sessionId;
    final session = _sessions.firstWhere((s) => s.id == sessionId);
    if (state is Ready) {
      emit(
        (state as Ready).copyWith(
          messages: session.messages,
          currentSessionId: _currentSessionId,
          sessions: _sessions,
        ),
      );
    }
  }

  Future<void> _initModel() async {
    emit(const .loadingModel());
    try {
      final error = await _chatbotService.initModel();
      if (error != null) {
        DebuggerHelper.talker.error(error);
        emit(.error(error));
      } else {
        final initialMessages = _currentSessionId != null
            ? _sessions
                  .firstWhere(
                    (s) => s.id == _currentSessionId,
                    orElse: () => ChatSession(
                      id: _currentSessionId!,
                      title: 'New Chat',
                      createdAt: DateTime.now(),
                      messages: [],
                    ),
                  )
                  .messages
            : <ChatMessage>[];

        emit(
          .ready(
            messages: initialMessages,
            sessions: _sessions,
            currentSessionId: _currentSessionId,
          ),
        );
      }
    } catch (e) {
      DebuggerHelper.talker.error(e.toString());
      emit(.error(e.toString()));
    }
  }

  Future<void> _saveSession(List<ChatMessage> messages) async {
    if (_currentSessionId == null) return;

    final title = messages.isNotEmpty
        ? (messages.first.text.length > 30
              ? '${messages.first.text.substring(0, 30)}...'
              : messages.first.text)
        : 'New Chat';

    final existingIndex = _sessions.indexWhere(
      (s) => s.id == _currentSessionId,
    );

    final session = ChatSession(
      id: _currentSessionId!,
      title: title,
      createdAt: existingIndex != -1
          ? _sessions[existingIndex].createdAt
          : DateTime.now(),
      messages: messages,
    );

    if (existingIndex != -1) {
      _sessions[existingIndex] = session;
    } else {
      _sessions.insert(0, session);
    }

    await _chatStorageService.saveSession(session);

    if (state is Ready) {
      emit((state as Ready).copyWith(sessions: _sessions));
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

    await _saveSession(updatedMessages);

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
            onDone: () async {
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

              await _saveSession(finalMessages);
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
