import 'package:talker_flutter/talker_flutter.dart';

class DebuggerHelper {
  static final talker = TalkerFlutter.init(
    settings: TalkerSettings(),
    logger: TalkerLogger(),
    filter: TalkerFilter(),
  );
}
