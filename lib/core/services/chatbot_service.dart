import 'dart:async';
import 'package:flutter_gemma/flutter_gemma.dart';
import 'package:injectable/injectable.dart';
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
    if (_activeModel != null) return '';

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
      preferredBackend: PreferredBackend.gpu,
    );

    if (_activeModel != null) {
      _activeChat = await _activeModel!.createChat();
    }

    return null;
  }

  Stream<String?> sendMessageStream(String message) async* {
    if (_activeChat == null) await initModel();

    await _activeChat!.addQueryChunk(Message.text(text: message, isUser: true));

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
