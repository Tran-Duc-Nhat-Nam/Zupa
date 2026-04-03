import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:zupa/core/helper/debugger/debugger_helper.dart';

@RoutePage()
class DebugScreen extends StatelessWidget {
  const DebugScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TalkerScreen(talker: DebuggerHelper.talker);
  }
}
