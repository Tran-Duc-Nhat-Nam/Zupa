import 'dart:async';
import 'package:flutter_gemma/flutter_gemma.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/constants/chatbot_context.dart';
import 'package:zupa/core/env/env.dart';

@singleton
class ChatbotService {
  final String _modelFileName = Env.modelName;
  final String _modelUrl = Env.modelUrl;
  final String _token = Env.huggingFaceToken;

  InferenceModel? _activeModel;
  InferenceChat? _activeChat;

  bool get isModelLoaded => _activeModel != null;

  Future<bool> isModelInstalled() async {
    try {
      return FlutterGemma.isModelInstalled(_modelFileName);
    } catch (e) {
      return false;
    }
  }

  Stream<double> installModelWithProgress() {
    final controller = StreamController<double>();

    FlutterGemma.installModel(modelType: .gemmaIt, fileType: .litertlm)
        .fromNetwork(_modelUrl, token: _token)
        .withProgress((progress) {
          // progress is an int (0-100)
          controller.add(progress / 100.0);
        })
        .install()
        .then((_) {
          controller.add(1.0);
          controller.close();
        })
        .catchError((e) {
          if (!controller.isClosed) {
            controller.addError(e);
            controller.close();
          }
        });

    return controller.stream;
  }

  Future<String?> initModel() async {
    if (_activeModel != null) return null;

    if (!FlutterGemma.hasActiveModel()) {
      try {
        await FlutterGemma.installModel(
          modelType: .gemmaIt,
          fileType: .litertlm,
        ).fromNetwork(_modelUrl, token: _token).install();
      } catch (e) {
        return e.toString();
      }
    }

    _activeModel = await FlutterGemma.getActiveModel(
      maxTokens: 4096,
      preferredBackend: .gpu,
    );

    if (_activeModel != null) {
      _activeChat = await _activeModel!.createChat();
      
      // Inject app summary context to act as an assistant
      await _activeChat!.addQueryChunk(.text(text: ChatbotContext.appSummary, isUser: true));
      await for (final _ in _activeChat!.generateChatResponseAsync()) {
        // Consumer the initial generation corresponding to the context to avoid sending it to the user
      }
    }

    return null;
  }

  Stream<String?> sendMessageStream(String message) async* {
    if (_activeChat == null) await initModel();

    await _activeChat!.addQueryChunk(.text(text: message, isUser: true));

    await for (final response in _activeChat!.generateChatResponseAsync()) {
      if (response is TextResponse) {
        yield response.token;
      }
    }
  }

  Future<void> stop() async {
    await _activeModel?.close();
    _activeModel = null;
    _activeChat = null;
  }
}
