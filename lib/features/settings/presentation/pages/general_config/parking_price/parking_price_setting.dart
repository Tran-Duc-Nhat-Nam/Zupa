import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:zupa/core/widgets/app_screen.dart';

class ParkingPriceSetting extends StatefulWidget {
  const ParkingPriceSetting({super.key});

  @override
  State<ParkingPriceSetting> createState() => _ParkingPriceSettingState();
}

class _ParkingPriceSettingState extends State<ParkingPriceSetting> {
  @override
  Widget build(BuildContext context) {
    return AppScreen(
      title: context.tr('parkingPrice'),
      child: Center(child: Text(context.tr('parkingPrice'))),
    );
  }
}
