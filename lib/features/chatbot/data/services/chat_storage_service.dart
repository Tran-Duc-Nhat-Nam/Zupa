import 'package:injectable/injectable.dart';
import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:zupa/features/chatbot/data/collections/chat_session_collection.dart';
import 'package:zupa/features/chatbot/domain/models/chat_session.dart';
import 'package:zupa/features/chatbot/presentation/bloc/chatbot_state.dart';

@lazySingleton
class ChatStorageService {
  Isar? _isar;

  Future<Isar> get _db async {
    if (_isar != null) return _isar!;
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [ChatSessionCollectionSchema],
      directory: dir.path,
    );
    return _isar!;
  }

  Future<void> saveSession(ChatSession session) async {
    final db = await _db;
    
    final collection = ChatSessionCollection()
      ..sessionId = session.id
      ..title = session.title
      ..createdAt = session.createdAt
      ..messages = session.messages.map((m) => ChatMessageEmbedded()
        ..text = m.text
        ..isUser = m.isUser).toList();

    await db.writeTxn(() async {
      await db.chatSessionCollections.put(collection);
    });
  }

  Future<List<ChatSession>> loadSessions() async {
    final db = await _db;
    final collections = await db.chatSessionCollections.where().sortByCreatedAtDesc().findAll();
    
    return collections.map((c) => ChatSession(
      id: c.sessionId,
      title: c.title,
      createdAt: c.createdAt,
      messages: c.messages.map((m) => ChatMessage(
        text: m.text ?? '',
        isUser: m.isUser ?? false,
      )).toList(),
    )).toList();
  }

  Future<void> deleteSession(String sessionId) async {
    final db = await _db;
    await db.writeTxn(() async {
      await db.chatSessionCollections.deleteBySessionId(sessionId);
    });
  }
}
