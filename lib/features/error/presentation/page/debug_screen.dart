import 'package:auto_route/annotations.dart';
import 'package:material_ui/material_ui.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:zupa/core/helper/debugger/debugger_helper.dart';

@RoutePage()
class DebugScreen extends StatelessWidget {
  const DebugScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      TalkerScreen(talker: DebuggerHelper.talker);
}
