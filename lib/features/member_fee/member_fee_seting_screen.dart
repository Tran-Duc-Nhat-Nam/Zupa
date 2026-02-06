
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import 'package:zupa/core/widgets/app_screen.dart';
import 'package:zupa/gen/strings.g.dart';

@RoutePage()
class MemberFeeSetingScreen extends StatefulWidget {
  const MemberFeeSetingScreen({super.key});

  @override
  State<MemberFeeSetingScreen> createState() => _MemberFeeSetingScreenState();
}

class _MemberFeeSetingScreenState extends State<MemberFeeSetingScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScreen(
      title: t.memberFee,
      child: Center(child: Text(t.memberFee)),
    );
  }
}
