import 'dart:async';
import 'package:flutter_gemma/flutter_gemma.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/helper/debugger/debugger_helper.dart';
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
        DebuggerHelper.talker.warning("No active model. Installing model...");
        await FlutterGemma.installModel(
          modelType: .gemmaIt,
          fileType: .litertlm,
        ).fromNetwork(_modelUrl, token: _token).install();
        DebuggerHelper.talker.info("Installing model finished");
      } catch (e) {
        return e.toString();
      }
    }

    DebuggerHelper.talker.info("Getting active model");
    _activeModel = await FlutterGemma.getActiveModel(
      maxTokens: 4096,
      preferredBackend: PreferredBackend.gpu,
    );
    DebuggerHelper.talker.info("Active model: ${_activeModel.toString()}");

    if (_activeModel != null) {
      DebuggerHelper.talker.info("Create active chat");
      _activeChat = await _activeModel!.createChat(
        systemInstruction:
            '<|think|> You are a logical assistant. Always reason step-by-step.',
      );
      DebuggerHelper.talker.info("Active chat: ${_activeChat?.fileType.name ?? "None"}");
    }

    return null;
  }

  Stream<String?> sendMessageStream(String message) async* {
    if (_activeChat == null) await initModel();

    DebuggerHelper.talker.info("Active chat: ${_activeChat?.fileType.name ?? "None"}");
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
