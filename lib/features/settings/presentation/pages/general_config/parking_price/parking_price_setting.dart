
import 'package:flutter/material.dart';

import 'package:zupa/core/widgets/app_screen.dart';
import 'package:zupa/gen/strings.g.dart';

class ParkingPriceSetting extends StatefulWidget {
  const ParkingPriceSetting({super.key});

  @override
  State<ParkingPriceSetting> createState() => _ParkingPriceSettingState();
}

class _ParkingPriceSettingState extends State<ParkingPriceSetting> {
  @override
  Widget build(BuildContext context) {
    return AppScreen(
      title: Translations.of(context).parkingPrice,
      child: Center(child: Text(Translations.of(context).parkingPrice)),
    );
  }
}
