import 'package:isar_community/isar.dart';

part 'chat_session_collection.g.dart';

@collection
class ChatSessionCollection {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String sessionId;

  late String title;
  
  late DateTime createdAt;

  late List<ChatMessageEmbedded> messages;
}

@embedded
class ChatMessageEmbedded {
  String? text;
  bool? isUser;
}
