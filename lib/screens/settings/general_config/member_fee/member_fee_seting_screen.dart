import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/app_screen.dart';

class MemberFeeSetingScreen extends StatefulWidget {
  const MemberFeeSetingScreen({super.key});

  @override
  State<MemberFeeSetingScreen> createState() => _MemberFeeSetingScreenState();
}

class _MemberFeeSetingScreenState extends State<MemberFeeSetingScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScreen(
      title: context.tr('memberFee'),
      child: Center(child: Text(context.tr('memberFee'))),
    );
  }
}
