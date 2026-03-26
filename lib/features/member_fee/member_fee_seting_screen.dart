import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/widgets/app_screen.dart';
import 'package:zupa/core/widgets/state/app_state.dart';

@RoutePage()
class MemberFeeSetingScreen extends StatefulWidget {
  const MemberFeeSetingScreen({super.key});

  @override
  AppState<MemberFeeSetingScreen> createState() =>
      _MemberFeeSetingScreenState();
}

class _MemberFeeSetingScreenState extends AppState<MemberFeeSetingScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScreen(
      title: t.parking.memberFee,
      child: Center(child: Text(t.parking.memberFee)),
    );
  }
}
