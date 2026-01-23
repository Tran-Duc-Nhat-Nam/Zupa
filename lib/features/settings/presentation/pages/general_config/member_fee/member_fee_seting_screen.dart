
import 'package:flutter/material.dart';

import 'package:zupa/core/widgets/app_screen.dart';
import 'package:zupa/gen/strings.g.dart';

class MemberFeeSetingScreen extends StatefulWidget {
  const MemberFeeSetingScreen({super.key});

  @override
  State<MemberFeeSetingScreen> createState() => _MemberFeeSetingScreenState();
}

class _MemberFeeSetingScreenState extends State<MemberFeeSetingScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScreen(
      title: Translations.of(context).memberFee,
      child: Center(child: Text(Translations.of(context).memberFee)),
    );
  }
}
